class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [400, 400]

  CarrierWave.configure do |config|
    config.dropbox_app_key = "oijvxm10ambxhjx"
    config.dropbox_app_secret = "umoszl4brjx9rsa"
    config.dropbox_access_token = "c9qkh32axhq2xtb8"
    config.dropbox_access_token_secret = "9283ueeqnnvkiz2"
    config.dropbox_user_id = "362480352"
    config.dropbox_access_type = "app_folder"
  end

  if Rails.env.production?
    storage :dropbox
  else
    storage :file
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end