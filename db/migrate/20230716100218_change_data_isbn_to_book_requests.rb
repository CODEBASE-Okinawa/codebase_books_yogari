class ChangeDataIsbnToBookRequests < ActiveRecord::Migration[7.0]
  def change
    change_column :book_requests, :isbn, :string 
  end
end
