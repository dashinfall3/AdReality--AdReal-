AdReality::Application.routes.draw do

  resources :stores

  resources :ads
  
  match 'ads/:developer_id/:category/:latitude/:longitude/:user_info', :to => 'ads#return', :constraints  => { :latitude => /[0-z\.-]+/ , :longitude => /[0-z\.-]+/ }, :as => :developer_id, :as => :category, :as => :latitude, :as => :longitude, :as => :category, :as => :user_info

  match 'ads/:developer_id/:category/:latitude/:longitude/:user_info', :to => 'ads#click', :constraints  => { :latitude => /[0-z\.-]+/ , :longitude => /[0-z\.-]+/ }, :as => :developer_id, :as => :category, :as => :latitude, :as => :longitude, :as => :category, :as => :user_info
  
  devise_for :advertisers

  devise_for :developers
  
  #need one for advertisers and developers
  match '/advertisers/:id', :to => 'advertisers#show', :as => :advertiser
  
  match '/developers/:id', :to => 'developers#show', :as => :developer

  resources :clicks

  resources :impressions

  root :to => 'pages#home'
  
end
