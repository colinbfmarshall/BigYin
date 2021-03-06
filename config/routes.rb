Rails.application.routes.draw do

  devise_for :admins
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  mount VideoUploader::UploadEndpoint, at: '/attachments/videos'

  root 'welcome#index'

  devise_for :users, controllers: { registrations: "registrations" }

  resources :topics do
    resources :posts
  end
  
  resources :posts, only: [:show, :index]
  resources :profiles

  resources :posts do 
    member do
      get "next", to: "posts#next"
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
  end 

  post "/webhooks/transloadit" do
    Shrine::Attacher.transloadit_save(params)
  end

  get 'welcome', :to => 'welcome#index'
  get 'about', :to => 'welcome#about'
  get 'conditions', :to => 'welcome#conditions'

  get "/404", :to => "errors#not_found"
  get "/422", :to => "errors#unacceptable"
  get "/500", :to => "errors#internal_server_error"

end