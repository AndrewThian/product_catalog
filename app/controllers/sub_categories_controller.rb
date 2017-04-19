class SubCategoriesController < ApplicationController
  before_action :set_sub_category, only: [:show, :edit, :update, :destroy]

  def index
    @sub_categories = SubCategory.all.order("name DESC")
  end

  def new
    @sub_category = SubCategory.new
  end

  def create
    # debugger
    @sub_category = SubCategory.new(sub_category_params)

    if @sub_category.save
      redirect_to sub_categories_path, notice: 'Sub Category was successfully created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sub_category.update(sub_category_params)
      redirect_to @sub_category, notice: 'Sub Category was successfully updated!'
    else
      render :edit
    end
  end

  def show
    @sub_sub_category = SubSubCategory.order("updated_at DESC").limit(5)
  end

  def destroy
    @sub_category.destroy
    redirect_to sub_categories_path, notice: 'Sub Category was successfully deleted'
  end

  private

  def sub_category_params
    params.require(:sub_category).permit(:name, :category_id, sub_sub_categories_attributes: [ :id, :name ])
  end

  def set_sub_category
    @sub_category = SubCategory.find(params[:id])
  end
end
