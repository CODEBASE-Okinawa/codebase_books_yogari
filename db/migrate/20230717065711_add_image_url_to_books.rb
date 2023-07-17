class AddImageUrlToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :image_url, :string
    add_index :books, :image_url
    add_index :books, :isbn, unique: true
  end
end
