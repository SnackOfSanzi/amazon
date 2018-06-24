class LikesController < ApplicationController

  before_action :set_variables, except: [:index]

  def index
    @like = Like.where(user_id: params[:user_id])

  end
  def create
    @like = Like.new(
      product_id: params[:product_id],
      user_id: current_user.id)
    @like.save
    end

  def destroy
    like = Like.find_by(
      product_id: params[:product_id],
      user_id: current_user.id)
    like.destroy
    end

  private

    def like_params
      params.require(:like).permit(:product_id, :user_id)

    end

    def set_variables
    @product = Product.find(params[:product_id])
    @likes = Like.where(product_id: params[:product_id])
    @id_name = "#like-link-#{@product.id}"
    @id_heart = "#heart-#{@product.id}"
    end
end
