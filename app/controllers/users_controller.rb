class UsersController < ApplicationController
	before_action :authenticate_user! 

	def show
		@polls = Poll.all
  		@user = User.includes(:vote_options).find_by_id(params[:id])
    end
end