require "shrine"
require "shrine/storage/google_cloud_storage"

Shrine.plugin :validation_helpers

Shrine.storages = {
  cache: Shrine::Storage::GoogleCloudStorage.new(bucket: "cache"),
  store: Shrine::Storage::GoogleCloudStorage.new(bucket: "store"),
}

