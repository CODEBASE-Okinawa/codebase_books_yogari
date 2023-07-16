class ChangeBookRequest < ActiveRecord::Migration[7.0]
  def change
    rename_table :book_requests, :request_books
  end
end
