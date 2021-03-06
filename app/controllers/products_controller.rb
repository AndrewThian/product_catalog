class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.order("name DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: 'Product successfully created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: 'Product successfully updated!'
    else
      render :edit
    end
  end

  def show
    @products_updated = Product.order("updated_at DESC").limit(5)
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: 'Product successfully deleted'
  end

  private

  def product_params
    params.require(:product).permit(:name,
                                    :description,
                                    :thumb_img,
                                    :price,
                                    :sub_sub_category_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
