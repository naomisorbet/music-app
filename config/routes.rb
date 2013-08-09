Hairbandtracker::Application.routes.draw do
  resources :albums do
    resources :tracks
  end

  resources :bands

end
