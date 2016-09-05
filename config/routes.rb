Rails.application.routes.draw do
  # root 'welcome#index'
  root 'videos#index'

  devise_for :users
  resources :videos

  mount VideoUploader::UploadEndpoint, at: "/attachments/videos"
end