Rails.application.routes.draw do

  devise_for :users

  # TODO(awong-dev) Remove non-nested routes.
  resources :acute_rehab1_years
  resources :acute_rehab90_days
  resources :acute_rehabs
  resources :annual_evaluations
  resources :omr1_years
  resources :omr90_days
  resources :omrs


  resources :patients do
    # TODO(awong-dev) Remove unused verbs from routes.
    resources :acute_rehab1_years
    resources :acute_rehab90_days
    resources :acute_rehabs
    resources :annual_evaluations
    resources :omr1_years
    resources :omr90_days
    resources :omrs
  end

  root to: redirect('/patients')
end
