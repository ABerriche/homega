class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  { host: ENV['HOST'] || 'localhost:3000' }
end
