class AddIconToPicks < ActiveRecord::Migration[5.2]
  def change
    add_reference :picks, :icon, foreign_key: true
  end
end
