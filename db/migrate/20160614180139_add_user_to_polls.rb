class AddUserToPolls < ActiveRecord::Migration
  def change
    add_reference :polls, :user, index: true
  end
end
