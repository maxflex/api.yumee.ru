class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :building
      t.string :corpus
      t.string :stroenie
      t.string :flat
      t.string :lat
      t.string :lng
      t.references :city, foreign_key: true, default: 1
    end
  end
end
