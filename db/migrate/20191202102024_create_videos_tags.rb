class CreateVideosTags < ActiveRecord::Migration[5.2]
  def change
    create_table :videos_tags do |t|
      t.references :tag, foreign_key: true
      t.references :video, foreign_key: true

      t.timestamps
    end
  end
end
