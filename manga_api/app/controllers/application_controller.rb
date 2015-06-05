class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #for grape
  config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
  config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]
end
