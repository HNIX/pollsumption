class AddLocationToVotes < ActiveRecord::Migration
  def change
  	add_column :votes, :longitude, :float
  	add_column :votes, :latitude, :float
  end
end
