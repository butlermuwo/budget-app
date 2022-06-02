class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories.includes(:payments).order(id: :desc)
  end

  def new; end

  def create
    add_category = current_user.categories.new(category_params)

    if add_category.save
      redirect_to '/categories', notice: 'Category has been Added'
    else
      render :new, alert: 'Did not add try again'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
