class VoteOptionPolicy < ApplicationPolicy

  def create?
  	user.present?
  end

end