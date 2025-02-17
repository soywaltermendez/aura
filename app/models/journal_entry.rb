class JournalEntry < ApplicationRecord
  belongs_to :user

  validates :content, presence: true
  validate :valid_mood_tag

  private

  def valid_mood_tag
    return if mood_tag.nil?
    unless MoodEntry::MOODS.keys.include?(mood_tag)
      errors.add(:mood_tag, :invalid)
    end
  end
end
