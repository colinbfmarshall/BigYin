class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :html, :json

  def transloadit
    Shrine::Attacher.transloadit_save(params)
    render nothing: true, status: 200
  end

end
