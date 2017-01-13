Rails.application.routes.draw do
  root 'rooms#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Server websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
