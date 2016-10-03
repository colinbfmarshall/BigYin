# require 'rubygems'
# require "streamio-ffmpeg"
class VideoUploader < Shrine
  plugin :versions

  def transloadit_process(io, context)
    original = transloadit_file(io)

    video = original.add_step("flash_encoding", "/video/encode", use: ":original", preset: "iphone", width: 640, height: 480, ffmpeg_stack: "v2.1.0", ffmpeg: { t: 5 } )

    screenshot = original.add_step('extracted_thumbs', '/video/thumbs',
                                    :use => "flash_encoding",
                                    :result => true )

    files = { video: video, screenshot: screenshot }
    
    transloadit_assembly(files, context: context)
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
