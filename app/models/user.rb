class User < ActiveRecord::Base
  has_many :repos
  require 'digest/sha1'
  authenticates_with_sorcery!
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.github_username = auth.info.nickname
      user.oauth_token = auth.credentials.token
      user.github_profile_img = auth.info.image
      user.repos_url = auth.extra.raw_info.repos_url
      rand_string = (0...8).map { (65 + rand(26)).chr }.join
      user.email = rand_string + "@example.com"
      user.password = Digest::SHA1.hexdigest rand_string
      user.save!
    end
  end

  def update_github_repos_and_commits
    # auth_str raises request rate limit from 60 to 5000 per hour
    auth_str = "?client_id=#{ENV['GITHUB_KEY']}&client_secret=#{ENV['GITHUB_SECRET']}"
    repos_url = self.repos_url + auth_str
    # Request user's repositories
    response = HTTParty.get(repos_url, headers: {"User-Agent" => "git-organized"})
    for i in 0...response.length
      current_repo = Repo.create(user_id: self.id,
                                    name: response[i]['name'],
                                birthday: response[i]['created_at'],
                             commits_url: response[i]['commits_url'],
                             description: response[i]['description'])
      commit_url_arr = response[i]['commits_url'].scan(/.+?(?={)/)
      commits_url = commit_url_arr[0] + auth_str
      # Request user's commits for each repository
      commits_response = HTTParty.get(commits_url, headers: {"User-Agent" => "git-organized"})
      for j in 0...commits_response.length
        commit_hash = commits_response[j]
        commit_hash.keep_if { |k, v| ['commit', 'committer'].include? k }
        commit_hash['commit'].keep_if { |k, v| ["committer", "message", "tree", "url"].include? k }
        commit_hash['committer'].keep_if { |k, v| k === "avatar_url" }
        binding.pry if j === 0
        Commit.create(repo_id: current_repo.id,
                commiter_name: commit_hash['commit']['committer']['name'],
                      message: commit_hash['commit']['message'],
                         date: commit_hash['commit']['committer']['date'],
                          sha: commit_hash['commit']['tree']['sha'],
                          url: commit_hash['commit']['url'],
                   avatar_url: commit_hash['committer']['avatar_url'])
      end
    end
  end
end
