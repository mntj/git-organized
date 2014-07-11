class User < ActiveRecord::Base
  authenticates_with_sorcery!
  binding.pry
  def self.from_omniauth(auth)
    binding.pry
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      binding.pry
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.github_email = auth.info['email']
      user.github_profile_img = auth.info['image']
      user.email = auth.info['email']
      user.save!
    end
  end
end
