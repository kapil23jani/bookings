Rails.application.routes.draw do
  get 'welcome/index'
  root "welcome#index"
  devise_for :users

  resources :users do
  	resources :profile_managers	
  end

  resources :theatres do 
  	resources :screens do
  		resources :sections
  	end
  end


  resources :movies

  get 'allshow' => "theatres#allshow"
  get 'showmovies' => "movies#showmovies"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
