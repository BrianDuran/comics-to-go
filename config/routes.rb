Rails.application.routes.draw do
  root 'welcome#index'
  resources :figures
  resources :comics
  resources :characters
  get '/sorted_table', to: 'figures#sorted_table', as: 'sorted_table'
end
