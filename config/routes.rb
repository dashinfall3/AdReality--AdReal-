AdReality::Application.routes.draw do

  resources :stores

  resources :ads

  devise_for :advertisers

  devise_for :developers

  resources :clicks

  resources :impressions

root :to => 'pages#home'
  
end
