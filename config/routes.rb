Rails.application.routes.draw do
  root 'welcome#index'
  resources :figures
  resources :comics
  resources :characters
  get '/sorted_table', to: 'figures#sort', as: 'sorted_table' #sort usar verbos para las acciones del controlador
end
