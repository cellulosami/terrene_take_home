Rails.application.routes.draw do
  get 'todos/:todo_id/items(/:page)', to: 'items#index'
  resources :todos do
    resources :items, shallow: true
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'users/:id', to: 'users#show'
end
