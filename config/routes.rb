Rails.application.routes.draw do
  devise_for :users
  resources :products do
  	resources :comments
  end
  root 'rooms#show', as: :rooms_show

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Server websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
