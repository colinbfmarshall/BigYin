Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users

  resources :topics do
    resources :posts
  end

  resources :posts, only: [:show] do
    resources :videos
  end

  mount VideoUploader::UploadEndpoint, at: "/attachments/videos"
end