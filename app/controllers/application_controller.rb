class ApplicationController < ActionController::Base
  before_action :authentificate_user!
end
