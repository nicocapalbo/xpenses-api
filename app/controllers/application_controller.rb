class ApplicationController < ActionController::API
  def current_user
    auth_token[0]['sub']
  end
end
