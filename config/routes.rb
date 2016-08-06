Rails.application.routes.draw do
  resources :tags
  resources :events do
    resources :images, only: [:show, :update]
  end
end
