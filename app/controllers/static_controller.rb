class StaticController < ApplicationController
  def homepage

    # REFACTOR THIS
    if params[:search]
      @products = Product.search(params[:search]).order("created_at DESC")
      return @products
    end

    if params[:category].blank?
      @products = Product.all
      return @products
    end
    
    if params[:category] && params[:sub_category] && params[:sub_sub_category]
      @sub_sub_category = SubSubCategory.find_by(name: params[:sub_sub_category])
      @products = Product.where(sub_sub_category: @sub_sub_category) if @sub_sub_category
      return @products
    end

    if params[:category] && params[:sub_category]
      @sub_category = SubCategory.find_by(name: params[:sub_category])
      @sub_sub_category_ids = SubSubCategory.where(sub_category_id: @sub_category).pluck(:id) if @sub_category
      @products = Product.where(sub_sub_category: @sub_sub_category_ids) if @sub_sub_category_ids
      return @products
    end

    if params[:category]
      @category = Category.find_by(name: params[:category])
      @sub_category_ids = SubCategory.where(category_id: @category.id).pluck(:id) if @category
      @sub_sub_category_ids = SubSubCategory.where(sub_category_id: @sub_category_ids).pluck(:id) if @sub_category_ids
      @products = Product.where(sub_sub_category: @sub_sub_category_ids) if @sub_sub_category_ids
      return @products
    end

  end
end
