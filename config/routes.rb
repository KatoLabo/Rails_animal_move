Rails.application.routes.draw do
  get 'chart_sample/index'


  resources :messies

  get "/" => "users#top"
  get "users/latest" => "users#latest"

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
