class AddImageToRequestBook < ActiveRecord::Migration[7.0]
  def change
    add_column :request_books, :image, :string
  end
end
