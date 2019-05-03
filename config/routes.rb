Rails.application.routes.draw do
  resources :messages, except: [:update, :show]
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
