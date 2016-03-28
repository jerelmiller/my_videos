CarrierWave.configure do |config|
  # For app folder storage
  # config.storage = :file
  # config.enable_processing = false

  # For S3 storage with all options
  # config.fog_provider = 'fog/aws'                          # required
  config.fog_credentials = {
    provider:              'AWS',                          # required
    aws_access_key_id:     ENV['aws_access_key_id'],       # required
    aws_secret_access_key: ENV['aws_secret_access_key'],   # required
    region:                ENV['aws_region']               # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = ENV['aws_bucket']                          # required # name of bucket
end
