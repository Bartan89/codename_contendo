class AddEngagementtToVideo < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :engagement, :integer, default: 0
  end
end


