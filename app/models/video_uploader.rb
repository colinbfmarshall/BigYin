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
    # options = { custom: %w(-c:v libx264 -t 00:00:20) } 
    # movie.transcode(video.path, options)
    # movie.screenshot(screenshot.path, seek_time: 5)
    # mov.delete

    # {video: video, screenshot: screenshot}
  end 


private
  def zencode(*args)
    params = {
      :input         => mov.path,
      :test          => true, #  https://app.zencoder.com/docs/guides/getting-started/test-jobs-and-integration-mode
      :outputs => [
        {
          :public      => true,
          :base_url    => base_url,
          :filename    => 'mp4_' + filename_without_ext + '.mp4',
          :label       => 'webmp4',
          :format      => 'mp4',
          :audio_codec => 'aac',
          :video_codec => 'h264'
        },
        {
          :public      => true,
          :base_url    => base_url,
          :filename    => 'webm_' + filename_without_ext + '.webm',
          :label       => 'webwebm',
          :format      => 'webm',
          :audio_codec => 'vorbis',
          :video_codec => 'vp8'
        },
        {
          :public      => true,
          :base_url    => base_url,
          :filename    => 'ogv_' + filename_without_ext + '.ogv',
          :label       => 'webogv',
          :format      => 'ogv',
          :audio_codec => 'vorbis',
          :video_codec => 'theora'
        },
        {
         :thumbnails => {
           :public      => true,
           :base_url    => base_url,
           :filename    => "thumbnail_" + filename_without_ext,
           :times       => [4],
           :aspect_mode => 'preserve',
           :width       => '100',
           :height      => '100'
         }
       }
     ]
    }
    z_response = Zencoder::Job.create(params)
    @post.video_data[:request] = z_response.body
    @post.save(:validate => false)
  end

  def base_url
    @base_url ||= File.dirname(@post.video.url)
  end

end