class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :reservation_at, null: false
      t.date :return_at, null: false

      t.timestamps
    end
  end
end
