class CreateJoinTableForUsersCategories < ActiveRecord::Migration
  def change
    create_table :categories_users, id: false do |t|
      t.belongs_to :category
      t.belongs_to :user
    end
  end
end
