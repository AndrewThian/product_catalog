class StaticController < ApplicationController
  def homepage
    if params[:category]
      @products = Product.all
    else
      @category = Category.find_by(name: params[:category])
    end
  end
end
