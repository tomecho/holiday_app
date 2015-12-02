Rails.application.routes.draw do
  root :to => 'holiday#index'
  get 'import', to: 'holiday#import'
  resources :holiday
end
