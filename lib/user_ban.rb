require "user_ban/version"
require "active_support"
require "active_support/core_ext"

module UserBan
  attr_accessor :suspention_expired_at
  include ActiveSupport::Configurable
  config_accessor :suspention_duration, :respawn_limit

  self.configure do |config|
    config.suspention_duration = 2.weeks
    config.respawn_limit = 5
  end

  def suspended?
    return false unless suspention_expired_at
    self.suspention_expired_at > Time.now
  end

  def suspended_until
    return nil unless suspention_expired_at
    remains = (self.suspention_expired_at - Time.now).to_i

    # If time remains between 1 second ~ 23 hours 59 seconds, it displays '1 day'
    (( remains / 1.day ) + 1 ).day
  end

  def suspend!
    self.suspention_expired_at = UserBan.suspention_duration.from_now
  end
end
