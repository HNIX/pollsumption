class VotesController < ApplicationController 
	def create
		if current_user && params[:poll] && params[:poll][:id] && params[:vote_option] && params[:vote_option][:id]
			@poll = Poll.find_by_id(params[:poll][:id])
			@option = @poll.vote_options.find_by_id(params[:vote_option][:id])
			authorize @option
			if @option && @poll && !current_user.voted_for?(@poll)
				@option.votes.create(user_ip: current_user.current_ip, user_id: current_user.id)
			else
				render js: 'alert(\'Your vote cannot be saved. Have you already voted?\');'
			end
		else
			render js: 'alert(\'Your vote cannot be saved.\');'
		end
	end
end

