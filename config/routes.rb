Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  get '/delete_all', to: 'posts#destroy_all'
  resources :posts, only: %i[index create destroy]
end
