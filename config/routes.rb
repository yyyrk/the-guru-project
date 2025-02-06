Rails.application.routes.draw do
  resources :tests do
    resources :questions, only: [:index, :show, :create, :destroy]
  end

  resources :tests, except: [:index, :show] # Уже объявил выше как родительский ресурс

  get "about", to: "static_pages#about"

  get "up" => "rails/health#show", as: :rails_health_check
end