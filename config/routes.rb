Rails.application.routes.draw do
  resources :professionals
  root 'professionals#index'
end
