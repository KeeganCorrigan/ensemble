Rails.application.routes.draw do
    root 'home#index'

    resources :musicians do
      resources :bands do
        post '/join_band', to: 'band_musicians#create'
      end
    end

    resources :songs

    resources :bands, only: [:index]

    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
end
