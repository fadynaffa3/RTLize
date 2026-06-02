require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)
require "rtlize"

module Dummy
  class Application < Rails::Application
    config.load_defaults Rails::VERSION::STRING.to_f

    config.filter_parameters += [:password]

    initializer "dummy.assets", after: "sprockets.environment" do
      config.assets.version = '1.0'
      config.assets.configure { |env| env.cache = ActiveSupport::Cache::NullStore.new }
    end
  end
end
