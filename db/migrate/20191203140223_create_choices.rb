class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.string :title
      t.string :content
      t.string :img
      t.string :color
      t.references :format, foreign_key: true

      t.timestamps
    end
  end
end
