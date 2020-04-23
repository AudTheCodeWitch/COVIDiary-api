class FixEssential < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :essential?, :is_essential
  end
end
