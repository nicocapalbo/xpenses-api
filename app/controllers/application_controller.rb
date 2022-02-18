class ApplicationController < ActionController::API
    def render_fail(code, status)
        errors = Array(errors)
        render json: {
          error_code: code,
        }, status:   status
    end
end
