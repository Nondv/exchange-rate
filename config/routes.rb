Rails.application.routes.draw do
  post '/admin', to: 'admin#force'
  get '/admin', to: 'admin#index'
  root 'exchange_rates#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
