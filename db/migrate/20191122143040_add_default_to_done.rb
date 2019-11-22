class AddDefaultToDone < ActiveRecord::Migration[5.2]
  def change
    change_column :translations, :done, :boolean, default: false
  end
end
