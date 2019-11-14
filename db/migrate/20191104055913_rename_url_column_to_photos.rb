class RenameUrlColumnToPhotos < ActiveRecord::Migration[5.2]
  def change
    rename_column :photos, :url, :image
  end
end