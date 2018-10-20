Rails.application.routes.draw do

  get "chart" => "chart_sample#index"

  get "post_ras" => "messies#post_ras"
  post "toras" => "messies#post_to_ras"

  get "messies/latest" => "messies#latest"
  resources :messies




  get "/" => "messies#top"
  get "users/latest" => "users#latest"

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
