Rails.application.routes.draw do
  post 'survivors/', to: 'survivors#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
