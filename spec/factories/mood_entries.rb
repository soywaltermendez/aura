FactoryBot.define do
  factory :mood_entry do
    association :user
    mood { MoodEntry::MOODS.keys.sample }
    energy_level { rand(1..5) }
    activities { MoodEntry::ACTIVITIES.sample(2) }
  end
end
