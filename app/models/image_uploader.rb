require "image_processing/mini_magick"

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick

  plugin :processing
  plugin :versions
  plugin :determine_mime_type
  # Might not need this depending on how the image uploading is handled on the front end
  plugin :cached_attachment_data

  process(:store) do |io, context|
    { original: io, thumb: resize_to_limit!(io.download, 300, 300) }
  end

  Attacher.validate do
    validate_mime_type_inclusion ["image/jpg", "image/jpeg", "image/png"]
  end
end
