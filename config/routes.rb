Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :individuals, only: %i[index show]
      resources :treatments, only: %i[index]
      resources :users, only: %i[index]
      resources :sessions
    end
  end
end
