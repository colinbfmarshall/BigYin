Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  # config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.serve_static_files = true
  config.assets.js_compressor = :uglifier
  config.assets.compile = true
  config.assets.digest = true
  config.log_level = :debug
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  config.active_record.dump_schema_after_migration = false
  
  config.action_mailer.default_url_options = { :host => 'www.votersminute.com' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
      address:              'smtp.gmail.com',
      port:                 587,
      domain:               'gmail.com',
      user_name:            ENV["EMAIL"],
      password:             ENV["EPASSWORD"],
      authentication:       'plain',
      enable_starttls_auto: true,
    }

  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true

end