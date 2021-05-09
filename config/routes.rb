Rails.application.routes.draw do


  
  devise_for :users, controllers: {
  registrations: "users/registrations"
  }
  
  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end
  #======================================
  
  resources :books do
    resource :favorites, only: [:create, :destroy]
    
    resources :book_comments, only: [:create, :destroy]
  end 
  
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
  # resources :chats, only: [:create, :show]
  
  get "search" => "searches#search", as: :search

end 


