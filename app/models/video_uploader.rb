# require 'rubygems'
# require "streamio-ffmpeg"
class VideoUploader < Shrine
  plugin :versions

  def transloadit_process(io, context)
    original = transloadit_file(io)
    video = original.add_step("encoding", "/video/encode", preset: "iphone-high", width: 640, height: 480, ffmpeg: { t: 20})
    screenshot = original.add_step("thumbnail", "/video/thumbs", count: 1)
    files = {video: video, screenshot: screenshot}
    if ENV["RACK_ENV"] == "production"
      notify_url = "https://infinite-reaches-64522.herokuapp.com/webhooks/transloadit"
    else
      # In development we cannot receive webhooks, because Transloadit as an
      # external service cannot reach our localhost.
    end

    transloadit_assembly(files, context: context, notify_url: notify_url )
  end

  # plugin :processing
  # process(:store) do |io, context|
  #   mov        = io.download
  #   video      = Tempfile.new(["video", ".mp4"], binmode: true)
  #   screenshot = Tempfile.new(["screenshot", ".jpg"], binmode: true)

  #   movie = FFMPEG::Movie.new(mov.path)
  #   options = { custom: %w(-c:v libx264 -t 00:00:20) } 
  #   movie.transcode(video.path, options)
  #   movie.screenshot(screenshot.path, seek_time: 5)
  #   mov.delete

  #   {video: video, screenshot: screenshot}
  # end
end
