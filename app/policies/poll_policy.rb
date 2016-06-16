class PollPolicy < ApplicationPolicy

  def index?
  	true
  end

  def new?
  	true
  end

  def create?
  	user.present?
  end
  
  def update?
  	user.present? && user == poll.user
  end
  
  def destroy?
    user.present? && user == poll.user
  end

  private
  
	  def poll
	    record
	  end

end
