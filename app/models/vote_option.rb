class VoteOption < ActiveRecord::Base
  belongs_to :poll
  validates :title, presence: true
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes

  def votes_percentage
  	if poll.votes_summary != 0 
	  (votes.count.to_f / poll.votes_summary.to_f * 100).ceil
	else
		0
	end
  end
end
