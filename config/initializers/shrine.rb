require "shrine"
require "shrine/storage/s3"
require "shrine/storage/url"

Shrine.storages = {
  cache: Shrine::Storage::Url.new,
  store: Shrine::Storage::S3.new(
    bucket:            ENV.fetch("S3_BUCKET"),
    region:            ENV.fetch("S3_REGION"),
    access_key_id:     ENV.fetch("S3_ACCESS_KEY_ID"),
    secret_access_key: ENV.fetch("S3_SECRET_ACCESS_KEY"),
  ),
}

Shrine.plugin :transloadit,
  auth_key: ENV.fetch("TRANSLOADIT_KEY"),
  auth_secret: ENV.fetch("TRANSLOADIT_SECRET")

Shrine.plugin :activerecord
Shrine.plugin :logging, logger: Rails.logger
Shrine.plugin :direct_upload, presign: true
Shrine.plugin :backgrounding


Shrine::Attacher.promote { |data| TransloaditJob.perform_async(data) }
Shrine::Attacher.delete { |data| DeleteJob.perform_async(data) }