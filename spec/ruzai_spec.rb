require 'spec_helper'

class TestUser
  include Ruzai
end

describe Ruzai do
  it 'has a version number' do
    expect(Ruzai::VERSION).not_to be nil
  end

  let(:user){ TestUser.new }

  describe '#suspended?' do
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

    context 'Over respawn limit' do
      before do
        user.suspended_count = 6
      end

      it { is_expected.to be true }
    end

    context 'Edit respawn limit' do
      before do
        Ruzai.configure do |config|
          config.respawn_limit = 3
        end
        user.suspended_count = 4
      end

      it { is_expected.to be true }
    end
  end

  describe '#suspended_until' do
    subject { user.suspended_until }

    context 'Non suspended user' do
      it { is_expected.to be_nil }
    end

    context 'Suspended user' do
      before do
        user.suspention_expired_at = Time.now + 1
      end
      it { is_expected.to eq 1.day}
    end
  end

  describe '#suspend!' do
    subject { user.suspend! }

    it "User's expired date is set to 2 weeks later." do
      subject
      expect(user.suspention_expired_at.to_date).to eq Date.today + 14.days
    end

    context 'Set expired date' do
      before do
        Ruzai.configure do |config|
          config.suspention_duration = 3.days
        end
      end

      it "User's expired date is set to 3 days later." do
        subject
        expect(user.suspention_expired_at.to_date).to eq Date.today + 3.days
      end
    end
  end
end
