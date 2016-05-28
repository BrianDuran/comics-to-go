Rails.application.routes.draw do
  resources :figures

  root 'comics#index'
  resources :comics
  resources :characters
end
