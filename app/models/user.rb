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

  def update_github_repos
    repos_url = self.repos_url
    response = HTTParty.get(repos_url, headers: {"User-Agent" => "git-organized"})
    for i in 0...response.length
      Repo.create(name: response[i]['name'], birthday: response[i]['created_at'], commits_url: response[i]['commits_url'], description: response[i]['description'])
    end
  end
end
