# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    render template: "pages/#{params[:page]}"
  rescue StandardError
    render file: 'public/404.html', status: :not_found
  end
end
