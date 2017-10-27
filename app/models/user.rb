class User < ApplicationRecord

  has_many :balances
  has_many :messages
  has_many :participations
  has_many :creations
  # has_many :groups, through: :creations
  has_many :groups, through: :participations


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  after_create :send_welcome_email


  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :lastname)
    user_params['picture_url'] = auth.info.image_size
    user_params['token'] = auth.credentials.token
    user_params['token_expiry'] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email)

    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0, 20]
      user.save
    end

    return user
  end

  def self.from_google_omniauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h
    # data = auth.info ...
    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email:auth.info.email)
    unless user
        user = User.new(user_params)
        user.password = Devise.friendly_token[0,20]
        user.save
    end
    user
  end

  private

  def send_welcome_email
    # UserMailer.welcome(self).deliver_now
  end
end
