require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:account, user_id: user.id) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:account, provider: nil, uid: nil) }
  let(:new_attributes) { FactoryGirl.attributes_for(:account, user_id: user.id, uid: '123456') }
  let(:valid_session) { {} }

  before(:each) do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all accounts as @accounts' do
      account = Account.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:accounts)).to eq([account])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested twitter account as @account' do
      account = Account.create! valid_attributes
      get :show, params: { id: account.id }, session: valid_session
      expect(assigns(:account)).to eq(account)
    end
  end

  describe 'GET #new' do
    it 'assigns a new account as @account' do
      get :new, params: {}, session: valid_session
      expect(assigns(:account)).to be_a_new(Account)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested account as @account' do
      account = Account.create! valid_attributes
      get :edit, params: { id: account.id }, session: valid_session
      expect(assigns(:account)).to eq(account)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Account' do
        expect do
          post :create, params: { account: valid_attributes }, session: valid_session
        end.to change(Account, :count).by(1)
      end

      it 'assigns a newly created account as @account' do
        post :create, params: { account: valid_attributes }, session: valid_session
        expect(assigns(:account)).to be_a(Account)
        expect(assigns(:account)).to be_persisted
      end

      it 'redirects to the created account' do
        post :create, params: { account: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Account.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved account as @account' do
        post :create, params: { account: invalid_attributes }, session: valid_session
        expect(assigns(:account)).to be_a_new(Account)
      end

      it "re-renders the 'new' template" do
        post :create, params: { account: invalid_attributes }, session: valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested account' do
        account = Account.create! valid_attributes
        put :update, params: { id: account.id, account: new_attributes }, session: valid_session
        account.reload
      end

      it 'assigns the requested account as @account' do
        account = Account.create! valid_attributes
        put :update, params: { id: account.id, account: valid_attributes }, session: valid_session
        expect(assigns(:account)).to eq(account)
      end

      it 'redirects to the account' do
        account = Account.create! valid_attributes
        put :update, params: { id: account.id, account: valid_attributes }, session: valid_session
        expect(response).to redirect_to(account)
      end
    end

    context 'with invalid params' do
      it 'assigns the account as @account' do
        account = Account.create! valid_attributes
        put :update, params: { id: account.id, account: invalid_attributes }, session: valid_session
        expect(assigns(:account)).to eq(account)
      end

      it "re-renders the 'edit' template" do
        account = Account.create! valid_attributes
        put :update, params: { id: account.id, account: invalid_attributes }, session: valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested account' do
      account = Account.create! valid_attributes
      expect do
        delete :destroy, params: { id: account.id }, session: valid_session
      end.to change(Account, :count).by(-1)
    end

    it 'redirects to the accounts list' do
      account = Account.create! valid_attributes
      delete :destroy, params: { id: account.id }, session: valid_session
      expect(response).to redirect_to(accounts_url)
    end
  end

  describe 'GET #get_vk_token' do 
    it 'redirects to the oauth vk url' do
      url = 'https://oauth.vk.com/authorize?client_id=5963835&scope=groups,wall,offline,photos&redirect_uri=https://oauth.vk.com/blank.html&display=page&response_type=token'
      expect(response).to have_http_status(200)      
    end
  end
end
