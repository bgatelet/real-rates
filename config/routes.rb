Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1, defaults: { format: 'json' } do
      post 'sign_in', to: 'user_token#create'
      post 'sign_up', to: 'registrations#create'
      resource :users, only: [:update, :show]
      resource :currencies, only: [:create, :update, :show]
    end
  end
end
