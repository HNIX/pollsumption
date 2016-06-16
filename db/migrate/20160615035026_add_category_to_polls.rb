class AddCategoryToPolls < ActiveRecord::Migration
  def change
    add_reference :polls, :category, index: true
  end
end
