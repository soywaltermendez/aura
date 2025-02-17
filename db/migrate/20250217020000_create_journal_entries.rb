class CreateJournalEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :journal_entries do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content, null: false
      t.string :mood_tag

      t.timestamps
    end
  end
end
