require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module YourAppName
  class Application < Rails::Application
  end
end
