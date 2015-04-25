Rails.application.routes.draw do
  devise_for :users
  resources :patients

  root to: 'patients#index'
end
