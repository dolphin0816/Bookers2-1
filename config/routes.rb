Rails.application.routes.draw do
  
  get 'homes/top'
  get 'homes/about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: "homes#top"
get '/home/about', to: 'homes#about', as: 'about'

resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
resources :users, only: [:index, :show, :edit, :update]

end
