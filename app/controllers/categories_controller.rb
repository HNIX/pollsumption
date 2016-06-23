class CategoriesController < ApplicationController 
  
  def show
  	@category = Category.find_by_id(params[:id])
  	authorize @category
  end

  def index
  	#show all the team on the index page
    @categories = Category.all
    authorize @categories
  end
  
  #create our own favorite action
  def favorite
  	category = Category.find(params[:id])
    authorize category
    unless current_user.categories.exists?(category)
  	  current_user.categories << category 
      flash[:success] = "You have successfully favorited #{category.name}"
      redirect_to :back
    else
      flash[:warning] = "You have already favorited #{category.name}"
      redirect_to :back
    end
  end

  def unfavorite
     category = Category.find(params[:id])
     user_category = current_user.categories.find(category)
     authorize category
     if user_category
        current_user.categories.delete(user_category)
     end

     redirect_to :back
  end

end