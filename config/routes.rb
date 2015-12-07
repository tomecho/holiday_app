Rails.application.routes.draw do
  root 'holiday#index'
  get '/holiday/country/:country_id', to: 'holiday#by_country', as: 'country_id'
  get '/holiday/date/:date', to: 'holiday#by_date', as: 'date'
  get '/holiday/name/:name', to: 'holiday#by_name', as: 'name'
  get '/holiday/date/:date/country/:country', to:'holiday#by_country_date'
  get '/holiday/country/:country/date/:date', to:'holiday#by_country_date'
  get '/holiday/date/range/:before/:after', to:'holiday#by_range'
  get '/holiday/country/:country/date/range/:before/:after', to:'holiday#by_range_country'
  get '/holiday/date/range/:before/:after/country/:country', to:'holiday#by_range_country' 
  get '/import/new', to: 'import#new'
  post '/import', to: 'import#create'
  resources :holiday
  resources :country
end
