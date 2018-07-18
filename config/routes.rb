Rails.application.routes.draw do
    root 'home#index'

    resources :musicians do
      resources :bands do
        post '/join_band', to: 'band_musicians#create'
        delete '/leave_band', to: 'band_musicians#destroy'
      end
    end

    resources :songs do
      resources :iterations
    end

    resources :bands, only: [:index]

    namespace :admin do
      resources :dashboard, only: [:index]
    end

    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
end
