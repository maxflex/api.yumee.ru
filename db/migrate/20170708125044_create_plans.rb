class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :title
      t.string :description
      t.string :logo
    end
  end
end
