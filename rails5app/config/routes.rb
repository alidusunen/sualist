Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :sessions => "sessions", :registrations => "registrations" }
  
  root 'home#show'
  get '/home' => 'home#index', as: :feed
  get '/popular' => 'home#show', as: :popular
  
  #get '/questions' => 'questions#index'
  #get '/question/:id' => 'questions#show', as: :question
  #get '/questions/new' => 'questions#new'
  #post 'questions' => 'questions#create'
  #get '/questions/:id/edit' => 'questions#edit'
  #patch '/questions/:id' => 'questions#update'
  #post '/questions/:id/delete' => 'questions#destroy'

  
    resources :questions do 
        member do
            put 'upvote' => 'questions#upvote'
            put 'downvote' => 'questions#downvote'
        end
    resources :answers 

    end

    resources :answers do 
             member do
                put 'upvote' => 'answers#upvote'
                put 'downvote' => 'answers#downvote'
            end
       
        resources :comments
    end
    resources :comments do 
        member do
                put 'upvote' => 'comments#upvote'
                put 'downvote' => 'comments#downvote'
            end
    end
    resources :categories do
        member do
            post :follow, :to => 'followers#create'
            delete :unfollow, :to => 'followers#destroy'
            get 'answer'
            get 'top'
        end
    end
    resources :users do
        member do
            get 'profile'
        end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
