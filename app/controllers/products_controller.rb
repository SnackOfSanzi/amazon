class ProductsController < ApplicationController

  def index

  end

  def show
    @product = Product.find(params[:id])
    @image = @product.bookimages
    @registration = @product.registrationinformation
  end

  def update
  end

end
