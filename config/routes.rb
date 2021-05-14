Rails.application.routes.draw do
  resources :posts, only: [:new, :create, :index]
  devise_for :users
  root 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
