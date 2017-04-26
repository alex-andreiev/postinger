require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:post, user_id: user.id) }
  let(:invalid_attribute_title) { FactoryGirl.attributes_for(:post, user_id: user.id, title: nil ) }
  let(:invalid_attribute_body) { FactoryGirl.attributes_for(:post, user_id: user.id, body: nil) }

  context 'validates' do
    it 'is valid with valid attributes' do
      post = Post.create! valid_attributes
      expect(post).to be_valid
    end

    it 'is not valid without a title' do
      post = Post.new(invalid_attribute_title)
      post.valid?
      expect(post.errors[:title]).to include("can't be blank")
    end

    it 'is not valid without body' do
      post = Post.new(invalid_attribute_body)
      post.valid?
      expect(post.errors[:body]).to include("can't be blank")
    end
  end

  context 'associations' do
    it 'should belongs_to user' do
      should belong_to(:user)
    end
  end
end
