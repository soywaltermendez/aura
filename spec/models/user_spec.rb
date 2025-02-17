require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:mood_entries).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe '#recent_mood_entries' do
    let(:user) { create(:user) }

    it 'returns mood entries from the last 24 hours' do
      old_entry = create(:mood_entry, user: user, created_at: 25.hours.ago)
      recent_entry = create(:mood_entry, user: user, created_at: 23.hours.ago)
      very_recent_entry = create(:mood_entry, user: user, created_at: 1.hour.ago)

      expect(user.mood_entries.recent).to include(recent_entry, very_recent_entry)
      expect(user.mood_entries.recent).not_to include(old_entry)
    end
  end
end
