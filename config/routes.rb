Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users

  resources :topics do
    resources :posts
  end

  resources :posts, only: [:show]

  mount VideoUploader::UploadEndpoint, at: "/attachments/videos"
end