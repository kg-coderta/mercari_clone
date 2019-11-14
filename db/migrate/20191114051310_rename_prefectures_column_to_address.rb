class RenamePrefecturesColumnToAddress < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :prefectures, :prefecture_id
  end
end
