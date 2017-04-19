class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_nested_categories

  def set_nested_categories
    hash = Hash.new
    # checking if category has products!
    categories = Category.includes(sub_categories: { sub_sub_categories: :products }).where.not( products: { id: nil })

    categories.each do |category|
      sub_cats = Array.new
      category.sub_categories.each do |sub_category|
        sub_cat = Hash.new
        sub_cat[sub_category.name] = sub_category.sub_sub_categories.pluck(:name)
        sub_cats.push(sub_cat)
      end
      hash[category.name] = sub_cats
    end
    @navbar_data = hash
  end
end
