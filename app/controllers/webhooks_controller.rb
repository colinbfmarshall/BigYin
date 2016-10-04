class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:transloadit]

  def transloadit
  end

end
