class CreateScenes < ActiveRecord::Migration[5.2]
  def change
    create_table :scenes do |t|
      t.integer :amount
      t.references :format, foreign_key: true

      t.timestamps
    end
  end
end
