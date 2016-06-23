class Category < ActiveRecord::Base
	has_many :polls
	has_and_belongs_to_many :users
end
