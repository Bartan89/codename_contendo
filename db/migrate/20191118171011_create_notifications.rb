class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :translation, foreign_key: true
      t.boolean :viewed

      t.timestamps
    end
  end
end
