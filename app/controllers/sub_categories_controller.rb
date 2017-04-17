class SubCategoriesController < ApplicationController
  def index
    @sub_categories = SubCategory.all
  end

  def new
  end
end
