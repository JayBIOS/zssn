Rails.application.routes.draw do
  resources :survivors, only: [:create, :update]

  post '/survivors/report', to: 'survivors#report'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
