class StaticController < ApplicationController
  def homepage
    if params[:category].blank?
      @products = Product.all
    else
      # debugger
      @category = Category.find_by(name: params[:category])
      @sub_category_ids = SubCategory.where(category_id: @category.id).pluck(:id) if @category
      @sub_sub_category_ids = SubSubCategory.where(sub_category_id: @sub_category_ids).pluck(:id) if @sub_category_ids
      return @products = Product.where(sub_sub_category: @sub_sub_category_ids) if @sub_sub_category_ids
    end
    if params[:sub_category].blank? && params[:category].blank?
      @products = Product.all
    else
      # debugger
      @sub_category = SubCategory.find_by(name: params[:sub_category])
      @sub_sub_category_ids = SubSubCategory.where(sub_category_id: @sub_category).pluck(:id) if @sub_category
      return @products = Product.where(sub_sub_category: @sub_sub_category_ids) if @sub_sub_category_ids
    end
    if params[:sub_sub_category].blank? && params[:sub_category].blank? && params[:category].blank?
      @products = Product.all
    else
      @sub_sub_category = SubSubCategory.find_by(name: params[:sub_sub_category])
      return @products = Product.where(sub_sub_category: @sub_sub_category) if @sub_sub_category
    end
  end
end
