class AddFirstNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :birth_year_id, :string
    add_column :users, :birth_month_id, :string
    add_column :users, :birth_day_id, :string
  end
end
