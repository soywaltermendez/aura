require 'rails_helper'

RSpec.describe MoodEntry, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:mood) }
    it { should validate_presence_of(:energy_level) }
    it { should validate_presence_of(:activities) }
    it { should validate_inclusion_of(:mood).in_array(MoodEntry::MOODS.keys) }
    it { should validate_inclusion_of(:energy_level).in_range(1..5) }
  end

  describe 'activities validation' do
    let(:user) { create(:user) }
    let(:valid_activities) { %w[trabajo ejercicio] }
    let(:invalid_activities) { ['invalid_activity'] }

    it 'allows valid activities' do
      mood_entry = build(:mood_entry, user: user, activities: valid_activities)
      expect(mood_entry).to be_valid
    end

    it 'rejects invalid activities' do
      mood_entry = build(:mood_entry, user: user, activities: invalid_activities)
      expect(mood_entry).not_to be_valid
      expect(mood_entry.errors[:activities]).to include(/contiene opciones no válidas/)
    end
  end
end
