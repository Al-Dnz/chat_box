Rails.application.routes.draw do
  get 'sessions/delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'

  get '/delete_all', to: 'posts#destroy_all'
  resources :posts, only: %i[index create destroy]
  resources :sessions, only: %i[new index create ]
end
