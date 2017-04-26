require 'rails_helper'

RSpec.describe RssfeedsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:rssfeed, user_id: user.id) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:rssfeed, title: nil, url: nil) }
  let(:new_attributes) { FactoryGirl.attributes_for(:rssfeed, user_id: user.id, title: 'New RSS') }
  let(:valid_session) { {} }

  before(:each) do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all rssfeed as @rssfeeds' do
      rssfeed = Rssfeed.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:rssfeeds)).to eq([rssfeed])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested rssfeed as @rssfeed' do
      rssfeed = Rssfeed.create! valid_attributes
      get :show, params: { id: rssfeed.id }, session: valid_session
      expect(assigns(:rssfeed)).to eq(rssfeed)
    end
  end

  describe 'GET #new' do
    it 'assigns a new rssfeed as @rssfeed' do
      get :new, params: {}, session: valid_session
      expect(assigns(:rssfeed)).to be_a_new(Rssfeed)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested rssfeed as @rssfeed' do
      rssfeed = Rssfeed.create! valid_attributes
      get :edit, params: { id: rssfeed.id }, session: valid_session
      expect(assigns(:rssfeed)).to eq(rssfeed)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new rssfeed' do
        expect do
          post :create, params: { rssfeed: valid_attributes }, session: valid_session
        end.to change(Rssfeed, :count).by(1)
      end

      it 'assigns a newly created rssfeed as @rssfeed' do
        post :create, params: { rssfeed: valid_attributes }, session: valid_session
        expect(assigns(:rssfeed)).to be_a(Rssfeed)
        expect(assigns(:rssfeed)).to be_persisted
      end

      it 'redirects to the created rssfeed' do
        post :create, params: { rssfeed: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Rssfeed.last)
      end
    end
    
    context 'with invalid params' do
      it 'assigns a newly created but unsaved rssfeed as @rssfeed' do
        post :create, params: { rssfeed: invalid_attributes }, session: valid_session
        expect(assigns(:rssfeed)).to be_a_new(Rssfeed)
      end

      it "re-renders the 'new' template" do
        post :create, params: { rssfeed: invalid_attributes }, session: valid_session
        expect(response).to render_template('new')
      end
    end
  end

end
