class ChangeWeightColumnUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :weight, :float
  end
end
