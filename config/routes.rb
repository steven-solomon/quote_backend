Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'quote', action: 'get', controller: 'quotes'
  get 'expiration', action: 'get', controller: 'expirations'
  get 'option_chain', action: 'get', controller: 'option_chains'
  resources 'option_trades', only: [:create, :index]
  get 'historical_data', action: 'get', controller: 'history'
end
