CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider              => 'AWS',
    :aws_access_key_id     => "#{ENV['AKIAIPXM5YKISEB5VVDA']}",
    :aws_secret_access_key => "#{ENV['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']}",
    :region                => "#{ENV['us-east-1']}",
    :path_style            => true
  }

  config.fog_directory =  "#{ENV['e-commerce-photos-production']}"
  config.cache_dir     = "#{Rails.root}/tmp/uploads"   # For Heroku
end