class CreateLendings < ActiveRecord::Migration[7.0]
  def change
    create_table :lendings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :return_at, null: false
      t.boolean :return_status, null: false, default: false

      t.timestamps
    end
  end
end
