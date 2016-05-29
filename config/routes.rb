Rails.application.routes.draw do
  root 'welcome#index'
  resources :figures
  resources :comics
  resources :characters
end
