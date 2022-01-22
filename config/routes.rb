Rails.application.routes.draw do
root 'home#top'
resource :user, only: [:new, :create, :show]
#以下３行を追加
get 'login', to: "sessions#new"
post 'login', to: "sessions#create"
delete 'logout', to: "sessions#destroy"
end
