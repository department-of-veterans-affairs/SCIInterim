Rails.application.routes.draw do

  devise_for :users

  resources :annual_evaluations
  resources :outpatient_episodes
  resources :acute_rehabilitations

  resources :patients do
      resources :annual_evaluations
      resources :outpatient_episodes
      resources :acute_rehabilitations
  end

  root to: redirect('/patients')
end
