Rails.application.routes.draw do
  root 'welcome#index'
  resources :figures
  resources :comics
  resources :characters
  get '/sorted_table', to: 'figures#sort', as: 'sorted_table' #sort usar verbos para las acciones del controlador
  get "*any", via: :all, to: "errors#not_found"
end
