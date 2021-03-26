class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :session_token
    add_index :users, :username
    add_index :users, :password_digest
  end
end
