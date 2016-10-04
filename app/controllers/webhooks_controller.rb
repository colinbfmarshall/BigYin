class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

    def transloadit
      render nothing: true, status: 200
    end


end
