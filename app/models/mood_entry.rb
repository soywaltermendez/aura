class MoodEntry < ApplicationRecord
  belongs_to :user

  MOODS = {
    'very_sad' => '😢',
    'sad' => '😔',
    'neutral' => '😐',
    'happy' => '🙂',
    'very_happy' => '😊'
  }.freeze

  ACTIVITIES = %w[
    trabajo
    ejercicio
    familia
    amigos
    hobbies
    descanso
    estudio
    entretenimiento
    meditación
    lectura
    música
    naturaleza
  ].freeze

  validates :mood, presence: true, inclusion: { in: MOODS.keys }
  validates :energy_level, presence: true, inclusion: { in: 1..5 }
  validates :activities, presence: true
  validate :activities_must_be_valid

  private

  def activities_must_be_valid
    return if activities.nil?

    invalid_activities = activities - ACTIVITIES
    return unless invalid_activities.any?

    errors.add(:activities, "contiene opciones no válidas: #{invalid_activities.join(', ')}")
  end
end
