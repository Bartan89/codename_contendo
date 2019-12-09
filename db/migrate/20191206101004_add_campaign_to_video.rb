class AddCampaignToVideo < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :campaign, :boolean, default: false
  end
end
