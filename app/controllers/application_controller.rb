class ApplicationController < ActionController::API
  def current_user
    return auth_token[0]['sub']
  end
end
