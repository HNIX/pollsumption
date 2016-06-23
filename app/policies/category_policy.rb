class CategoryPolicy < ApplicationPolicy

  def favorite?
  	user.present?
  end

  def index?
    true
  end

  def unfavorite?
  	true
  end

end