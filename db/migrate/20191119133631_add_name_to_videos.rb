class AddNameToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :name, :string
  end
end
