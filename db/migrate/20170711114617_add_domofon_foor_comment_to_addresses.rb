class AddDomofonFoorCommentToAddresses < ActiveRecord::Migration[5.1]
  def up
    add_column :addresses, :floor, :integer
    add_column :addresses, :domofon, :string
    add_column :addresses, :comment, :string
  end
end
