class User < ActiveRecord::Base
  authenticates_with_sorcery!

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.now + auth.extra.access_token.params[:oauth_expires_in].to_i
      user.github_email = auth.info['email']
      user.github_profile_img = auth.info['image']
      user.email = auth.info['email']
      user.save!
    end
  end
end
