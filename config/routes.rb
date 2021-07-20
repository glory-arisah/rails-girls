Rails.application.routes.draw do
  root to: 'ideas#index'
  get 'pages/info'
  resources :ideas do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
