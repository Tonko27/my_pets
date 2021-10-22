Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions: "customers/sessions",
    registrations: "customers/registrations"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get '/about',to: 'homes#about'
  #get '/search', to: 'searches#search'
  get '/pets/search',  to: 'pets#search'
  resources :notifications, only: [:index, :destroy]
  resources :customers, only: [:show]
  resources :pets do
    resource :favorites, only: [:create, :destroy]
    resources :pet_comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

end
