require 'rails_helper'

RSpec.describe Rssfeed, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:rssfeed, user_id: user.id) }
  let(:invalid_attribute_title) { FactoryGirl.attributes_for(:rssfeed, user_id: user.id, title: nil ) }
  let(:invalid_attribute_url) { FactoryGirl.attributes_for(:rssfeed, user_id: user.id, url: nil) }

  context 'validates' do
    it 'is valid with valid attributes' do
      rssfeed = Rssfeed.create! valid_attributes
      expect(rssfeed).to be_valid
    end

    it 'is not valid without a title' do
      rssfeed = Rssfeed.new(invalid_attribute_title)
      rssfeed.valid?
      expect(rssfeed.errors[:title]).to include("can't be blank")
    end

    it 'is not valid without url' do
      rssfeed = Rssfeed.new(invalid_attribute_url)
      rssfeed.valid?
      expect(rssfeed.errors[:url]).to include("can't be blank")
    end
  end

  context 'associations' do
    it 'should belongs_to user' do
      should belong_to(:user)
    end
  end
end
