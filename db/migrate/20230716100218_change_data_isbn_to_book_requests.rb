class ChangeDataIsbnToBookRequests < ActiveRecord::Migration[7.0]
  def change
    change_column :book_requests, :isbn, :string
    rename_table :book_requests, :request_books
  end
end
