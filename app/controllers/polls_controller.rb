class PollsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_poll, only: [:edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_filter :set_category

  def index
    if params[:search]
      @polls = Poll.search(params[:search]).order(sort_column + " " + sort_direction).page params[:page]
    else
      @polls = Poll.all.order(sort_column + " " + sort_direction).page params[:page]
    end
    authorize @polls
  end

  def show
    @poll = Poll.includes(:vote_options).find_by_id(params[:id])
    authorize @poll
  end

  def new
    @poll = Poll.new
    authorize @poll
  end

  def create
    @poll = Poll.new(poll_params)
    authorize @poll
    if @poll.save
    	flash[:success] = 'Poll was created!'
    	redirect_to polls_path
    else
    	render 'new'
    end
  end

  def edit 
  end

  def update
    if @poll.update_attributes(poll_params)
      flash[:success] = 'Poll was updated!'
      redirect_to polls_path
    else
      render 'edit'
    end
  end

  def destroy
    if @poll.destroy
      flash[:success] = 'Poll was destroyed!'
    else
      flash[:warning] = 'Error destroying poll...'
    end
    redirect_to polls_path
  end

  private

  def set_category 
    @categories = Category.all
  end

  def sort_column
    Poll.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  def set_poll
    @poll = Poll.find_by_id(params[:id])
    authorize @poll
  end
  
  def poll_params
  	params.require(:poll).permit(:topic,:category_id, :user_id, vote_options_attributes: [:id, :title, :_destroy])
  end
end
