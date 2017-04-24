require "rails_helper"

describe "home#register as a provider", :type => :request do

  it "redirects to oauth#callback" do
    get '/userrs/auth/twitter'
    expect(response).to redirect_to(oauth_callback_path(:twitter))
  end

end
