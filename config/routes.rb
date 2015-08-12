Rails.application.routes.draw do

  devise_for :users

  get 'reports' => 'reports#index'

  # Entity reports require you to pick an entity in order to run a report
  get 'reports/entity/:entity'                       => 'reports#pick_entity'
  get 'reports/entity/:entity/:entity_id'            => 'reports#entity_reports'
  get 'reports/entity/:entity/:entity_id/:report_id' => 'reports#output_report'

  resources :patients do
    resources :acute_rehabs, except: [:index, :destroy]
    resources :annual_evaluations, except: [:index, :destroy]
    resources :omrs, except: [:index, :destroy]
  end

  resources :facilities

  root to: redirect('/patients')
end
