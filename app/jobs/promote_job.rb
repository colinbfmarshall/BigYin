class PromoteJob
  include Sidekiq::Worker
  sidekiq_options :retry => 3
  
  def perform(data)
    Shrine::Attacher.transloadit_process(data)
  end
end