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

  describe '#activities_must_be_valid' do
    let(:user) { create(:user) }

    it 'allows valid activities' do
      mood_entry = build(:mood_entry, activities: MoodEntry::ACTIVITIES.sample(2))
      expect(mood_entry).to be_valid
    end

    it 'rejects invalid activities' do
      mood_entry = build(:mood_entry, activities: ['invalid_activity'])
      expect(mood_entry).not_to be_valid
      expect(mood_entry.errors[:activities]).to include(/contiene opciones no válidas/)
    end
  end
end
