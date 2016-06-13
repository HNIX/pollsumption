class Users::SessionsController < Devise::SessionsController
  include ApplicationHelper
  layout "signup"
  
  def create
    super
  end

  def new
    super
  end
end
