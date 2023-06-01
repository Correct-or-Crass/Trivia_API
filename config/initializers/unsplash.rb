Unsplash.configure do |config|
  config.application_access_key = "#{ENV['unsplash_access_key']}"
  config.application_secret = "#{ENV['unsplash_application_secret']}"
  config.application_redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
  config.utm_source = "Trivia_API"
end