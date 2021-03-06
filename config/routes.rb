Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :individuals
      resources :treatments
      resources :transfers
      resources :areas, only: %i[index destroy create]
      resources :barns, only: %i[show destroy create]
      resources :blocks, only: %i[destroy create]
      resources :treat_comments, only: %i[create index destroy]
      resources :symptom_tags, only: %i[index destroy create]
      resources :disease_tags, only: %i[index destroy create]
      resources :medicine_tags, only: %i[index destroy create]
      resources :individual_tags, only: %i[index destroy create]
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks], controllers: {
        registrations: 'api/v1/auth/registrations'
      }

      namespace :auth do
        resources :sessions, only: %i[index]
      end
    end
  end
end
