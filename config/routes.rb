Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get '/:page' => 'pages#show'
  root 'pages#show', page: 'home'
end
