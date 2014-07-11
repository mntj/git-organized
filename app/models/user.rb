class User < ActiveRecord::Base
  authenticates_with_sorcery!
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      #Github tokens never expire, so ^$*#@%!&
      #user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.github_email = auth.info['email']
      user.github_profile_img = auth.info['image']
      user.email = user.github_email || "anon@ymous.com"
      user.password = "moomoo"
      user.save!
    end
  end
end
