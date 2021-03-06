require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BarBetsApp
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.action_controller.perform_caching = true
    config.action_controller.page_cache_directory = "#{Rails.root.to_s}/public/deploy"
  end
end
