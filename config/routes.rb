Rails.application.routes.draw do

  devise_for :users

  get 'reports' => 'reports#index'

  # Entity reports require you to pick an entity in order to run a report
  get 'reports/entity/:entity'                       => 'reports#pick_entity'
  get 'reports/entity/:entity/:entity_id'            => 'reports#entity_reports'
  get 'reports/entity/:entity/:entity_id/:report_id' => 'reports#run_report'

  # TODO(awong-dev) Remove non-nested routes.
  resources :acute_rehab1_years
  resources :acute_rehab90_days
  resources :acute_rehabs
  resources :annual_evaluations
  resources :omr1_years
  resources :omr90_days
  resources :omrs

  resources :patients do
    resources :acute_rehab1_years, except: [:index, :show, :destroy]
    resources :acute_rehab90_days, except: [:index, :show, :destroy]
    resources :acute_rehabs, except: [:index, :show, :destroy]
    resources :annual_evaluations, except: [:index, :show, :destroy]
    resources :omr1_years, except: [:index, :show, :destroy]
    resources :omr90_days, except: [:index, :show, :destroy]
    resources :omrs, except: [:index, :show, :destroy]
  end

  root to: redirect('/patients')
end
