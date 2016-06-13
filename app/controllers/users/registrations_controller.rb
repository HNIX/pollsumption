class Users::RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper
  layout "signup"

  def create
    super
  end

  def new
    super
  end

  def edit
    super
  end
end
