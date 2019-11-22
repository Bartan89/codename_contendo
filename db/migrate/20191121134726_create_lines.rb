class CreateLines < ActiveRecord::Migration[5.2]
  def change
    create_table :lines do |t|
      t.string :title
      t.text :content
      t.string :img
      t.references :translation, foreign_key: true

      t.timestamps
    end
  end
end
