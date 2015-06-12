Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'questions/:id' => 'question#return_array'
    end
  end
  get '*path', controller: 'application', action: 'handle_404'
end
