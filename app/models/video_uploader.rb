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

    video = original.add_step('video_encoding', '/video/encode',
                              :use => ":original",
                              ffmpeg_stack: "v2.2.0",
                              ffmpeg: { t: 5 }
                              )

    screenshot = original.add_step('thumbnails', '/video/thumbs',
                                    :use => ":original"
                                    )

    files = { video: video, screenshot: screenshot }
  end

end
