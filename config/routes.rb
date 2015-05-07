Rails.application.routes.draw do
  devise_for :users
  resources :patients
  resources :episode_of_cares

  root to: redirect('/patients')
end
