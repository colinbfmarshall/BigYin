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

  get 'welcome', :to => 'welcome#index'
  get 'about', :to => 'welcome#about'
  get 'conditions', :to => 'welcome#conditions'


end