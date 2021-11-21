Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'ledgers#index'
  resources :ledgers do
    resources :dashboard
    resources :accounts
    resources :transactions
    resources :categories
  end
  resources :accounts
  resources :transactions
  resources :dashboards
end
