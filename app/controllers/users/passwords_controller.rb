class Users::PasswordsController < Devise::PasswordsController
  include ApplicationHelper
  layout "signup"
  
  def new
    super
  end
end
