class User < ActiveRecord::Base
  authenticates_with_sorcery!
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      binding.pry
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.github_username = auth.info.nickname
      user.oauth_token = auth.credentials.token
      #Github tokens never expire!
      #user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.github_email = auth.info.email
      user.github_profile_img = auth.info['image']
      user.email = user.github_email || "anon@ymous.com"
      user.password = "notarealpassword"
      user.save!
    end
  end
end
