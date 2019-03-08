Rails.application.routes.draw do
  get 'welcome/index'
  root "welcome#index"
  devise_for :users

  resources :users do
  	resources :profile_managers	

  	resources :theatres do 
  	resources :screens do
  		resources :sections
  	end
  end

  	resources :movies
  	resources :movieshows do 
  		resources :bookings
  end
  	get 'allshow' => "theatres#allshow"
  	get 'showmovies' => "movies#showmovies"
  	get 'show_details' => "movieshows#show_details"
  end

  

  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
