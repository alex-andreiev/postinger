require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:account, user_id: user.id) }
  let(:invalid_attribute_provider) { FactoryGirl.attributes_for(:account, user_id: user.id, provider: nil ) }
  let(:invalid_attribute_uid) { FactoryGirl.attributes_for(:account, user_id: user.id, uid: nil) }

  context 'validates' do
    it 'is valid with valid attributes' do
      account = Account.create! valid_attributes
      expect(account).to be_valid
    end

    it 'is not valid without a provider' do
      account = Account.new(invalid_attribute_provider)
      account.valid?
      expect(account.errors[:provider]).to include("can't be blank")
    end

    it 'is not valid without uid' do
      account = Account.new(invalid_attribute_uid)
      account.valid?
      expect(account.errors[:uid]).to include("can't be blank")
    end
  end

  context 'associations' do
    it 'should belongs_to user' do
      should belong_to(:user)
    end
  end
end
