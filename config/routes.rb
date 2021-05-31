Rails.application.routes.draw do
  get 'todos/:todo_id/v2/items(/:page)', to: 'items#index'
  resources :todos do
    resources :items, shallow: true, path: "v2/items"
    resources :items, path: "v1/items"
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'users/:id', to: 'users#show'
end
