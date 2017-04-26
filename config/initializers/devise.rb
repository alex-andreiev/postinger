Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.omniauth :facebook, Rails.application.secrets.facebook_api_key, Rails.application.secrets.facebook_api_secret
  config.omniauth :twitter, Rails.application.secrets.twitter_api_key, Rails.application.secrets.twitter_api_secret
  config.omniauth :vkontakte, Rails.application.secrets.vk_api_key, Rails.application.secrets.vk_api_secret
  #config.omniauth :google_oauth2, Rails.application.secrets.google_api_id, Rails.application.secrets.google_api_key
  config.omniauth :odnoklassniki, Rails.application.secrets.odnoklassniki_app_id, Rails.application.secrets.odnoklassniki_app_secret,  :public_key => Rails.application.secrets.odnoklassniki_app_public
end
