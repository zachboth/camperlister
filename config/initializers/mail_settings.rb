# Load settings for Rails environment.
if %w[test production].include? Rails.env
  YAML.load_file("#{Rails.root.to_s}/config/settings/#{Rails.env}.yml")
else
  YAML.load_file("#{Rails.root.to_s}/config/settings/#{Rails.env}.local.yml")
end
