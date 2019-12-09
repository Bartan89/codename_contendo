class AddHiddenToIcon < ActiveRecord::Migration[5.2]
  def change
    add_column :icons, :hidden, :boolean, default: false
  end
end
