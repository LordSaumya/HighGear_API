Rails.application.routes.draw do
  #Routes
  get 'users/s/:username', to: "users#search"
  get 'users/:username/comments', to: "users#comments"
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :forum_threads, only: [:index, :show, :create, :update, :destroy] do
    resources :comments, only: [:index, :show, :create, :update, :destroy]
  end
end
