Rails.application.routes.draw do


  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update]
  
  post 'follow/:id' => 'relationships#create', as: 'follow'
  post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow' 
  
  resources :books do
    resource :favorites, only: [:create, :destroy]
    
    resources :book_comments, only: [:create, :destroy]
  end 
  
end 



