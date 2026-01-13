require "sidekiq/web"

Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => "/sidekiq"
  end

  devise_for :users, controllers: {
    registrations: "registrations"
  }
  resources :posts, except: [ :edit, :update ] do
    resources :comments, only: [ :create, :destroy ]
    resources :likes, only: [ :create, :destroy ]
    member do
      post :repost
    end
  end
  resources :profiles
  root "posts#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
