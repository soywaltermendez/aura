class CreateMoodEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :mood_entries do |t|
      t.references :user, null: false, foreign_key: true
      t.string :mood, null: false
      t.integer :energy_level, null: false
      t.string :activities, array: true, default: []
      t.datetime :timestamp, null: false

      t.timestamps
    end

    # Agregar un índice GIN para búsquedas eficientes en el array
    add_index :mood_entries, :activities, using: 'gin'
  end
end
