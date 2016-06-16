class AddIpToVotes < ActiveRecord::Migration
  def change
  	add_column :votes, :user_ip, :string
  end
end
