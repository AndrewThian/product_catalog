class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated!'
    else
      render :edit
    end
  end

  def show
    # show last edited sub category
    @sub_category = SubCategory.order("updated_at DESC").limit(5)
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully deleted'
  end

  private

  def category_params
    params.require(:category).permit(:name, sub_categories_attributes: [ :id, :name, :_destroy ])
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
