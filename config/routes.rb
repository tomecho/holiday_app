Rails.application.routes.draw do
  root 'holiday#index'
  resources :holiday
end
