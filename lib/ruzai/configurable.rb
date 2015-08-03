require "active_support"
require "active_support/core_ext"

module Ruzai
  include ActiveSupport::Configurable
  config_accessor :suspention_duration, :respawn_limit

  self.configure do |config|
    config.suspention_duration = 2.weeks
    config.respawn_limit = 5
  end
end
