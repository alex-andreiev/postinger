require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'PATCH #finish_signup' do
    it 'assigns a new user as @user' do
      patch :finish_signup, params: {}
    end
  end

end
