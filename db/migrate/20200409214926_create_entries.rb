class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.references :user, null: false, foreign_key: true

      # user personal assessments
      t.integer :health_rating
      t.boolean :symptoms_present?
      t.text :health_comments
      t.integer :mental_health_rating
      t.text :mental_health_comments

      # actual diary entry
      t.text :diary_entry

      t.timestamps
    end
  end
end
