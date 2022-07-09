Rails.application.routes.draw do

  root :to => 'homes#top'
  resources :books
  devise_for :users
  get "homes/about" => "homes#about", as: "about"

  resources :books, only: [:new, :create, :index, :show]
  resources :users, only: [:new, :index, :show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
