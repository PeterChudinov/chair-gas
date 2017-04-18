Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'gas#index'

  get '/:state', to: 'gas#show'
end
