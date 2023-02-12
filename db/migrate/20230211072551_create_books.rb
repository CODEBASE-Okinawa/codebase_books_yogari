class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false, uniqueness: true
      t.string :cover_image

      t.timestamps
    end
  end
end
