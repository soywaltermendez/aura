class AddNotesToMoodEntries < ActiveRecord::Migration[7.1]
  def change
    add_column :mood_entries, :notes, :text
  end
end
