Rails.application.routes.draw do
  
  get 'sessions/login'
  get 'sessions/logout'
  resources :portfolios do 
    resources :projects
    resources :skill_categories do 
      resources :skills
    end
    resources :messages
    member do
      delete 'delete_image/:image_id', action: 'delete_image', as: 'delete_image'
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  post "/login", to: "sessions#login"
  get "/logout", to: "sessions#logout"
  get "/portfolios/:id/public", to: "portfolios#public"
end
