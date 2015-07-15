require "user_ban/version"

module UserBan
  attr_accessor :suspention_expired_at

  def suspended?
    return false unless suspention_expired_at
    self.suspention_expired_at > Time.now
  end
end
