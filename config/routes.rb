Pipeline::Application.routes.draw do
  
  resources :deals

  resources :brokers_steps

  get '/deals/:id/property', to: 'deals#property_information', as: :deals_property
  get '/deals/:id/address', to: 'deals#address', as: :deals_address
  get '/deals/:id/overview', to: 'deals#overview', as: :deals_overview
  get '/deals/:id/photos', to: 'deals#photos', as: :deals_photos









  resources :users, :only => :show

  devise_for :users, :controllers => { :registrations => "registrations" }, 
             :skip => [:sessions, :passwords] 
 
  devise_scope :user do
    get  '/register', to: 'devise/registrations#new', as: :register
    # post '/register', to: 'devise/registrations#create', as: :user_registration
    # put  '/register', to: 'devise/registrations#edit', as: :registration
    get  '/dashboard/profile/edit', to: 'devise/registrations#edit', as: :edit

    get  '/login', to: 'devise/sessions#new', as: :new_user_session    
    post '/login', to: 'devise/sessions#create', as: :user_session  
    get  '/logout', to: 'devise/sessions#destroy', as: :logout
    
    get  '/password/new', to: 'devise/passwords#new', as: :new_user_password
    post '/password/new', to: 'devise/passwords#create', as: :user_password
  end

  root to: "static_pages#home"

  get '/market', to: 'market_places#index', as: :market
  
end
