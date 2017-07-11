class AddIndexToUsers < ActiveRecord::Migration[5.1]
  def up
    add_index :users, :phone, unique: true
  end

  def down
    drop_index :users, :phone
  end
end
