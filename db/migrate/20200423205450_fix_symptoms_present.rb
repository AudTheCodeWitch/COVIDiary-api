class FixSymptomsPresent < ActiveRecord::Migration[6.0]
  def change
    rename_column :entries, :symptoms_present?, :is_symptomatic
  end
end
