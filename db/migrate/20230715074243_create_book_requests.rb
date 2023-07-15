class CreateBookRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :book_requests do |t|
      t.integer :isbn, null: false
      t.string :title, null: false
      t.string :author, null: false
      t.boolean :status, default: true, null: false

      t.timestamps
    end
  end
end
