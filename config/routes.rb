Rails.application.routes.draw do
  resources :tests do
    resources :questions, only: [ :index, :show, :new, :create, :destroy ]
  end

  get "about", to: "static_pages#about"

  get "up" => "rails/health#show", as: :rails_health_check
end
