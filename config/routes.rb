Rails.application.routes.draw do

  resources :tweets, only: [:index, :new, :create, :edit, :update ,:destroy] do
    collection do
      post :confirm
    end
  end  
  
  get 'tweets/index'
  #https://mutter-kanaikohei.c9users.io/tweets/でアクセス可
  get 'tweets' => 'tweets#index'

  get 'comments/index'

  get 'comments' => 'comments#index' 
  
  root 'top#index'
    
end
