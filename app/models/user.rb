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
      user.github_email = auth.info.email
      user.github_email = rand_string + "@example.com" if user.github_email.empty?
      user.email = user.github_email
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
        Commit.create(repo_id: current_repo.id,
                commiter_name: commits_response[j]['commit']['committer']['name'],
                      message: commits_response[j]['commit']['message'],
                         date: commits_response[j]['commit']['committer']['date'],
                          sha: commits_response[j]['commit']['tree']['sha'],
                          url: commits_response[j]['commit']['url'],
                   avatar_url: commits_response[j]['committer']['avatar_url'])
      end
    end
  end
end
