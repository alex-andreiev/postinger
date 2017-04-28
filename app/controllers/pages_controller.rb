class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    if template_exists?("pages/#{params[:page]}")
      render template: "pages/#{params[:page]}"
    else
      render template: "pages/404"
    end
  end
end
