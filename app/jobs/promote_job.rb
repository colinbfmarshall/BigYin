class PromoteJob
  include Sidekiq::Worker
  sidekiq_options :retry => 3
  
  def perform(data)
    Shrine::Attacher.promote(data)
  end
end