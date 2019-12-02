class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :videos, :shephard_id, :shepherd_id
  end
end
