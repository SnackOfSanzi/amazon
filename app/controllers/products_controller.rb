class ProductsController < ApplicationController

  def index

  end

  def show
  end

  def update
  end

  def search
    @products = Product.where('name LIKE(?)', "%#{params[:keyword]}%").includes([:bookimages]).limit(20)
    # binding.pry
  end
end


#@books = Product.includes([:bookimages, :registrationinformations]).order('id ASC').page(params[:page]).per(42)
