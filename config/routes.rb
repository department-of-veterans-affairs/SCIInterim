Rails.application.routes.draw do
  devise_for :users

  resources :patients do
    # TODO(awong.dev): Remove unneeded verbs from route.
    resources :annual_evaluations
    resources :outpatient_episodes
    resources :acute_rehabilitations
    resources :omr1_years
    resources :omr90_days
    resources :omrs
  end

  root to: redirect('/patients')
end
