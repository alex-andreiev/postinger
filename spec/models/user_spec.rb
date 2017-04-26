require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }

  context 'configured' do
    it 'twitter client' do
      Account.create! FactoryGirl.attributes_for(:account, provider: 'twitter', user_id: user.id)
      expect(user.twitter.to_s).to include("Twitter::REST::Client")
    end

    it 'facebook client' do
      Account.create! FactoryGirl.attributes_for(:account, provider: 'facebook', token_fb: '12345678', user_id: user.id)
      expect(user.facebook.to_s).to include("Koala::Facebook::API")
    end

    it 'vkontakte client' do
      Account.create! FactoryGirl.attributes_for(:account, provider: 'vkontakte', token_vk: '12345678', user_id: user.id)
      expect(user.vkontakte.to_s).to include("VkontakteApi::Client")
    end

    it 'odnoklassniki client' do
      Account.create! FactoryGirl.attributes_for(:account, provider: 'odnoklassniki', token_odnoklassniki: '12345678', user_id: user.id)
      expect(user.odnoklassniki.to_s).to include("Odnoklassniki::Client")
    end
  end

  context 'associations' do
    it 'should has_many posts' do
      should have_many(:posts)
    end

    it 'should has_many accounts' do
      should have_many(:accounts)
    end

    it 'should has_many rssfeeds' do
      should have_many(:rssfeeds)
    end    
  end
end
