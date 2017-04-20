require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #show' do
    it 'render an existing page template' do
      get :show, params: {page: "about"} 
      expect(response).to render_template("pages/about")
    end

    it 'render annonexisting page template' do
      get :show, params: {page: "nonexisting_page"} 
      expect(response).to render_template("pages/404")
    end
  end
end

