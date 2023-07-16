class AddIsbnToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :isbn, :integer, :null => false
  end
end