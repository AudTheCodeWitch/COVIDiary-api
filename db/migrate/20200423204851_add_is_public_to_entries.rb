class AddIsPublicToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :is_public, :boolean
  end
end
