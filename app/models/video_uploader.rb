require 'rubygems'
require "streamio-ffmpeg"

class VideoUploader < Shrine
  plugin :processing
  plugin :versions

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


  def transloadit_process(io, context)
    original = transloadit_file(io)
      .add_step('flash_encoding', '/video/encode',
                :use => ":original",
                :preset => "flash",
                :width => 640,
                :height => 480,
                :ffmpeg_stack => "v2.0.0",
                :ffmpeg => { t: "00:00:15" } )

    thumbnail = original
      .add_step('extracted_thumbs', '/video/thumbs',
                :use => "flash_encoding",
                :result => true )

    files = { video: video, screenshot: screenshot }

    if ENV["RACK_ENV"] == "production"
      notify_url = "https://infinite-reaches-64522.herokuapp.com/webhooks/transloadit"
    else
      # In development we cannot receive webhooks, because Transloadit as an
      # external service cannot reach our localhost.
    end

    transloadit_assembly(files, notify_url: notify_url )
  end

end
