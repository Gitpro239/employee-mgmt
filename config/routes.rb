Rails.application.routes.draw do
  #  devise_for :users
  # devise_for :admin, controllers: {
  #     sessions: 'admin/sessions',
  #     registrations: 'admin/registrations'
  # }

  devise_for :users, controllers: {
      sessions: "users/sessions"
  }
  resources :departments
  resources :roles
  resources :employees

  get "employees/index"
  get "pages/users"
  get "pages/admin"

  root "pages#home"

  # root "employees#index"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
