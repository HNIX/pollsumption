class CreateVotes < ActiveRecord::Migration
  def change
      add_reference :votes, :user, unique: true
      add_reference :votes, :vote_option, unique: true
  end
end
