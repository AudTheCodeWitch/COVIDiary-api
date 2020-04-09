class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.datetime :birth_date
      t.string :occupation
      t.boolean :essential?
      t.datetime :isolation_start
      t.datetime :isolation_end
      t.text :about

      t.timestamps
    end
  end
end
