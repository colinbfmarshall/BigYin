class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[not_found internal_server_error]

  def not_found
    render(:status => 404)
  end

  def internal_server_error
    render(:status => 500)
  end

  def unacceptable
    render(:status => 422)
  end

end