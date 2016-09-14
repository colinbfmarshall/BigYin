require 'rubygems'
require "streamio-ffmpeg"

class VideoUploader < Shrine
  plugin :processing
  plugin :versions

  process(:store) do |io, context|
    mov        = io.download
    video      = Tempfile.new(["video", ".mp4"], binmode: true)
    screenshot = Tempfile.new(["screenshot", ".jpg"], binmode: true)

    movie = FFMPEG::Movie.new(mov.path)
    options = { custom: %w( -c:v libx264 -b:v 1000k -profile:v baseline -level 3.0 -movflags faststart -t 00:00:20) } 
    movie.transcode(video.path, options)
    movie.screenshot(screenshot.path)
    mov.delete

    {video: video, screenshot: screenshot}
  end

end