# config/routes.rb
Rails.application.routes.draw do
  resources :todos do
    resources :items, shallow: true
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end