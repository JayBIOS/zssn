Rails.application.routes.draw do
  get 'reports/infected'

  get 'reports/non_infected'

  get 'reports/average_resource'

  get 'reports/points_lost'

  resources :items, only: %i[index]
  resources :survivors, only: %i[create update]

  post '/survivors/:id/trade', to: 'survivors#trade'
  post '/survivors/:id/report', to: 'survivors#report'

  root to: 'about#info'
end
