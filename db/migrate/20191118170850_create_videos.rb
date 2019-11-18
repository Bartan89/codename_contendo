class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.references :user, foreign_key: true
      t.string :video_path
      t.string :project_path

      t.timestamps
    end
  end
end
