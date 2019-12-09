class AddNameToIcon < ActiveRecord::Migration[5.2]
  def change
    add_column :icons, :name, :string
  end
end
