Hairbandtracker::Application.routes.draw do
  resources :albums do
    resources :tracks, :only => [:new, :create]
  end
  resources :tracks, :only => [:edit, :destroy, :show, :update]
  resources :bands
  resource :session, :only => [:new, :create, :destroy]



  root :to => "session#new"
end
