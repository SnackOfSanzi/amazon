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

  def search
    @products = Product.where('name LIKE(?)', "%#{params[:keyword]}%").includes([:bookimages]).limit(20)
  end

end
