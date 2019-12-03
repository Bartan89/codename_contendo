class CreateIcons < ActiveRecord::Migration[5.2]
  def change
    create_table :icons do |t|
      t.text :json
      t.references :format, foreign_key: true

      t.timestamps
    end
  end
end
