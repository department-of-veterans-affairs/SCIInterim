Rails.application.routes.draw do
  resources :patients

  root 'patients#index'
end
