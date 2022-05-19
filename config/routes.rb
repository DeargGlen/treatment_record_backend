Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :individuals, only: %i[index show create]
      resources :treatments, only: %i[index create]
      
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks], controllers: {
        registrations: 'api/v1/auth/registrations'
      }

      namespace :auth do
        resources :sessions, only: %i[index]
      end
    end
  end
end
