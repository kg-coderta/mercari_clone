class AddDetailsToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :saler, null: false, foreign_key: { to_table: :users }
    add_reference :items, :buyer, foreign_key: { to_table: :users }
  end
end
