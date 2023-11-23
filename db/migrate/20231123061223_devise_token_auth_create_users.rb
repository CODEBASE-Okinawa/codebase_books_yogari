class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :provider, :string, null: false, default: 'email'
    add_column :users, :uid, :string, null: false, default: ''
    add_column :users, :tokens, :text
  end

  def down
    # if you added **encrypted_password** above, add here to successfully rollback
    remove_columns :users, :provider, :uid, :tokens
  end

end
