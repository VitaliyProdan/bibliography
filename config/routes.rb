Rails.application.routes.draw do
  root 'base#index'

  resources :biblios, only: [:create, :show]
end
