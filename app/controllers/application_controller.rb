class ApplicationController < ActionController::API
  def current_user
    auth_token[0]['sub']
  end

  def render_fail(code, status)
      errors = Array(errors)
      render json: {
        error_code: code,
      }, status:   status
  end
end
