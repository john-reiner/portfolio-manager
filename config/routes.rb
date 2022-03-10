Rails.application.routes.draw do
  get 'sessions/login'
  get 'sessions/logout'
  resources :skills
  resources :skill_categories
  resources :projects
  resources :portfolios do 
    resources :messages
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  post "/login", to: "sessions#login"
end
