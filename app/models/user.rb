class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :mood_entries, dependent: :destroy
  has_many :journal_entries, dependent: :destroy

  PROFILE_IMAGES = {
    'sunset' => {
      url: 'profiles/sunset.jpg',
      name: 'Atardecer en la playa',
      description: 'Un hermoso atardecer que nos recuerda que cada día es un nuevo comienzo'
    },
    'forest' => {
      url: 'profiles/forest.jpg',
      name: 'Bosque tranquilo',
      description: 'La serenidad de la naturaleza nos ayuda a encontrar paz interior'
    },
    'mountains' => {
      url: 'profiles/mountains.jpg',
      name: 'Montañas majestuosas',
      description: 'Las montañas nos inspiran a superar cualquier obstáculo'
    }
  }.freeze

  validates :profile_image, inclusion: { in: PROFILE_IMAGES.keys }, allow_nil: true
end
