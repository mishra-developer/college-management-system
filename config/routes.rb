Rails.application.routes.draw do
  get "attendances/index"

  namespace :admin do
    # resources :users
    resources :students
    resources :teachers
    resources :parents
    resources :transports
    # resources :leave_request
    resources :securities
    resources :class_rooms
    resources :lactures
    resources :attendances
    root to: "students#index"
  end

  get "teachers/scaffold"
  get "students/index"
  get "students/new"
  get "students/edit"
  get "profiles/index"
  get "profiles/show"
  get "welcome/index"
  devise_for :users, controllers: {
    sessions: 'users/sessions' ,
    # Tell Devise to use the overridden controller
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  resources :students
  resources :teachers
  resources :class_rooms
  resources :lactures do
    resources :attendances
  end
  
  resources :leave_requests do
    collection do
      post :apply_early_leave, to: 'leave_requests#create_early_leave'
      get  :apply_early_leave, to: 'leave_requests#apply_early_leave'
    end
    member do
      patch :update_status
      get :update_status  # temporary
    end
  end
  resources :profiles
  root "welcome#index"
end
