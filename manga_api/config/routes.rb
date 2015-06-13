Rails.application.routes.draw do
  devise_for :admin_users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :api do
    namespace :v1 do
      get 'questions/:id' => 'question#return_array'
    end
  end
  get '*path', controller: 'application', action: 'handle_404'
end
