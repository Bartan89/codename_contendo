class AddReferenceToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :videos, :shephard, foreign_key: {to_table: :users}
  end
end
