require "sidekiq/web"

Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => "/sidekiq"
  end

  devise_for :users
  resources :posts, except: [ :edit, :update ]
  resources :profiles
  root "posts#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
