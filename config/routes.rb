Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  mount VideoUploader::UploadEndpoint, at: "/attachments/videos"

  root 'welcome#index'
  devise_for :users
  resources :topics do
    resources :posts
  end
  resources :posts, only: [:show]
end