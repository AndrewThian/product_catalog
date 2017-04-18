class SubSubCategoriesController < ApplicationController
  before_action :set_sub_sub_category, only: [:show, :edit, :update, :destroy]

  def index
    @sub_sub_categories = SubSubCategory.all
  end

  def new
    @sub_sub_category = SubSubCategory.new
  end

  def create
    # debugger
    @sub_sub_category = SubSubCategory.new(sub_sub_category_params)

    if @sub_sub_category.save
      redirect_to sub_sub_categories_path, notice: 'Sub Sub Category was successfully created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sub_sub_category.update(sub_sub_category_params)
      redirect_to @sub_sub_category, notice: 'Sub Sub Category was successfully updated!'
    else
      render :edit
    end
  end

  def show
    @sub_sub_category = SubSubCategory.order("updated_at DESC").limit(5)
  end

  def destroy
    @sub_sub_category.destroy
    redirect_to sub_sub_categories_path, notice: 'Sub Sub Category was successfully deleted'
  end

  private

  def sub_sub_category_params
    params.require(:sub_sub_category).permit(:name, :sub_category_id, sub_sub_categories_attributes: [ :id, :name ])
  end

  def set_sub_sub_category
    @sub_sub_category = SubSubCategory.find(params[:id])
  end
end
