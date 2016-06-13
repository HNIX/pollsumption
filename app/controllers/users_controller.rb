class UsersController < ApplicationController
	def show
		@polls = Poll.all
  		@user = User.includes(:vote_options).find_by_id(params[:id])
    end
end