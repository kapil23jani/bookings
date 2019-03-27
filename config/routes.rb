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

  	resources :movies do 
  		resources :castings
  	end
  	
  	resources :movieshows do 
  		resources :bookings
    end

    resources :bookings
    resources :casts

    get 'screen_select' , to: "movieshows#screen_select"
    get 'assign_cast' , to: "casts#assign_cast"
  	get 'allshow' , to: "theatres#allshow"
  	get 'showmovies' , to: "movies#showmovies"
  	get 'show_details' , to: "movieshows#show_details"
  end
  	get '/sort_movie_show' , to:'movieshows#sort_movie_show'
  

  

  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
