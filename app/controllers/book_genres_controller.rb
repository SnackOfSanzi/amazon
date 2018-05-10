class BookGenresController < ApplicationController

  def index
  @books = Product.all
  end

  def show
    @books = Product.includes([:bookimages, :registrationinformation]).order('id ASC').page(params[:page]).per(42)
  end
end
