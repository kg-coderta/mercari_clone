class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.text :description, null:false
      t.string :state, null:false
      t.string :size
      t.string :method, null:false
      t.string :region, null:false
      t.string :date, null:false
      t.string :price, null:false

      t.timestamps
    end
  end
end
