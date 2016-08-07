Rails.application.routes.draw do
  resources :tags, only: [:index, :new, :create] do
    get :move_tagged_images
  end

  resources :events do
    resources :images, only: [:show, :update]
  end
end
