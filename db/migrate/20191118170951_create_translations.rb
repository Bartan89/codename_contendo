class CreateTranslations < ActiveRecord::Migration[5.2]
  def change
    create_table :translations do |t|
      t.references :user, foreign_key: true
      t.references :video, foreign_key: true
      t.string :language
      t.string :json
      t.boolean :done

      t.timestamps
    end
  end
end
