Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'posts/new' => 'posts#new'
  get 'posts/index' => 'posts#index'
  delete 'posts/:id' => 'posts#destroy'
  get 'posts/:id' => 'posts#show',as: 'post'

  resources :users, only: [:show]

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end  
  
  resources :perfumes

  root 'posts#index'

end
