class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|

      t.string :first_name
      t.string :last_name
      t.datetime :birthdate
      t.string :occupation
      t.boolean :essential
      t.datetime :isolation_start
      t.datetime :isolation_end
      t.text :about
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
