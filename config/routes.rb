Rails.application.routes.draw do

  root 'home#top'
  resource :user, only: [:new, :create, :show]
get 'login', to: "sessions#new"
post 'login', to: "sessions#create"
delete 'logout', to: "sessions#destroy"
resources :post_images, only: [:new, :create, :index, :show, :destroy]
end
