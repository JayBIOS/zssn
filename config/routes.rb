Rails.application.routes.draw do
  get 'reports/infected'

  get 'reports/non_infected'

  get 'reports/average_resource'

  get 'reports/points_lost'

  resources :survivors, only: %i[create update]

  post '/survivors/report', to: 'survivors#report'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
