Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  root 'articles#index'
  
  resources :articles do
    resources :comments
  end
  
 # get '/articles' => 'articles#index'

 # get 'articles/new' => 'articles#new'
 # post 'articles' => 'articles#create'

 # get 'articles/:id' => 'articles#show'
end

