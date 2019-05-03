Rails.application.routes.draw do
  resources :messages, except: [:update, :show]
  post 'auth/login', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
