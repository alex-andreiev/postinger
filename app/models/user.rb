class User < ApplicationRecord
  TEMP_EMAIL_PREFIX = 'change@me'.freeze
  TEMP_EMAIL_REGEX = /\Achange@me/

  has_many :posts
  has_many :accounts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable,
         omniauth_providers: %i[facebook twitter vkontakte google_oauth2]

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Account.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
    if user.nil?
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(email: email).first if email
      if user.nil?
        user = User.new(
          username: auth.extra.raw_info.name,
          password: Devise.friendly_token[0, 20],
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com"
        )
        #user.skip_confirmation!
        user.save!
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    email && email !~ TEMP_EMAIL_REGEX
  end

  # get current user
  class << self
    def current_user=(user)
      Thread.current[:current_user] = user
    end

    def current_user
      Thread.current[:current_user]
    end
  end

  def twitter
    secret = Account.where(provider: 'twitter').first
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_api_key
      config.consumer_secret     = Rails.application.secrets.twitter_api_secret
      config.access_token        = secret.token_tw
      config.access_token_secret = secret.secret_tw
    end
  end

  def vk
    secret = Account.where(provider: 'vkontakte').first
    @vk = VkontakteApi::Client.new(secret.token_vk)
  end
end
