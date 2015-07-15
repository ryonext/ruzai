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

    context 'Non suspended user' do
      it { is_expected.to be false }
    end

    context 'Suspended user' do
      before do
        user.suspention_expired_at = Time.now + 1
      end
      it { is_expected.to be true }
    end

    context 'Suspended before' do
      before do
        user.suspention_expired_at = Time.now + 1
        Timecop.freeze(Date.today + 1)
      end

      it { is_expected.to be false }

      after do
        Timecop.return
      end
    end
  end
end
