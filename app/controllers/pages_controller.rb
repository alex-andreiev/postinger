# frozen_string_literal: true

class PagesController < ApplicationController
  def show
    render template: "pages/#{params[:page]}"
  rescue
    render file: 'public/404.html', status: :not_found
  end
end
