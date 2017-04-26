module OmniauthMacros
  def twitter_auth_hash
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      :provider => 'twitter',
      'uid' => '718397310183555072',
      'info' => {
        'email' => 'test@tw.com',
      },
      'credentials' => {
        'token' => 'twitter_token',
        'secret' => 'twitter_secret'
      }
    })
  end

  def vkontakte_auth_hash
    OmniAuth.config.mock_auth[:vkontakte] = OmniAuth::AuthHash.new({
      :provider => 'vkontakte',
      'uid' => '12345678',
      'info' => {
        'email' => 'test@vk.com',
      },
      'credentials' => {
        'token' => 'vkontakte_token'
      }
    })
  end

  def facebook_auth_hash
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      :provider => 'facebook',
      'uid' => '2345678',
      'info' => {
        'email' => 'test@fb.com',
      },
      'credentials' => {
        'token' => 'vkontakte_token'
      }
    })
  end
end
