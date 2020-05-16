Rails.application.routes.draw do
  root 'home#index'

  post '/search', to: 'home#search', as: 'search'

  resources :articles
  resources :analytics, only: %i[index]
end
