Rails.application.routes.draw do
  # root 'welcome#index'
  root 'videos#index'

  devise_for :users
  resources :videos

  patch "/topic" => "videos#update"
  post "/topic/videos" => "videos#create"


  mount VideoUploader::UploadEndpoint, at: "/attachments/videos"
end