require 'spec_helper'

class TestUser
  include UserBan
end

describe UserBan do
  it 'has a version number' do
    expect(UserBan::VERSION).not_to be nil
  end

  describe 'suspended?' do
    let(:user){ TestUser.new }
    subject { user.suspended? }

    it { is_expected.to be false }
  end
end
