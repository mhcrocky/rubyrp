class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog
  # storage :aws

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    "fallback/" + [version_name, "avatar.png"].compact.join('_')
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_whitelist
    %w(jpg jpeg gif png)
    # %w(txt doc docx ppt pptx xls xlsx pdf gif jpg jpeg png mov mp3 pages)
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fill: [1044, 675]
  # end
  #
  # version :small_thumb, from_version: :thumb do
  #   process resize_to_fill: [348, 225]
  # end

end
