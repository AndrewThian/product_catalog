class SubCategoriesController < ApplicationController
  before_action :set_sub_category, only: [:show, :edit, :update, :destroy]

  def index
    @sub_categories = SubCategory.all
  end

  def new
    @sub_category = SubCategory.new
  end

  def create
    @sub_category = SubCategory.new(sub_category_params)

    if @sub_category.save
      redirect_to sub_categories_path, notice: 'Sub Category was successfully created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:sub_category).permit(:name, sub_sub_categories_attributes: [ :id, :name ])
  end

  def set_sub_category
    @category = Category.find(params[:id])
  end
end
