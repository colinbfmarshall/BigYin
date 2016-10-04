class PromoteJob
  include Sidekiq::Worker
  sidekiq_options :retry => 3
  
  def perform(data)
    attacher = Shrine::Attacher.transloadit_process(data)
    # Webhooks won't work in development environment, so we can just use polling.
    unless ENV["RACK_ENV"] == "production"
      response = attacher.get.transloadit_response
      until response.finished?
        sleep 1
        response.reload!
      end
      attacher.transloadit_save(response.body)
    end
  end

end