class ChangeColumnToNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :books, :isbn, true
  end
end
