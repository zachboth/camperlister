class Photo < ApplicationRecord
  belongs_to :listing
  include ImageUploader[:image]
end
