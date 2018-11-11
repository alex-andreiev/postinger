Rails.application.routes.draw do
  devise_for :users
  get '/:page' => 'pages#show'
  root 'pages#show', page: 'home'
end
