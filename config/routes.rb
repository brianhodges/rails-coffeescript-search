Rails.application.routes.draw do
  resources :authors
  get '/search' => 'authors#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
