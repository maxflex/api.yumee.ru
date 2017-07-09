class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :preferences, array: true, default: [1, 2, 3, 4, 5]
      t.references :address, foreign_key: true
      t.references :plan, foreign_key: true
      t.integer :age
      t.integer :height
      t.integer :weight
      t.timestamps
    end
  end
end
