Rails.application.routes.draw do

  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  get "search" => "searches#search"
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
  get :followeds, on: :member
  get :followers, on: :member
end
end
