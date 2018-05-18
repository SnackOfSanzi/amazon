class OrdersController < ApplicationController
    before_action :setup_order_product, only: [:index, :add_product, :update_product, :delete_product]

    def index
      gon.total_count = @total_count
      gon.total_price = @total_price
    end

  def show
    @order_product = current_order.order_products
  end

  def add_product
    if @order_product.blank?
      @order_product = current_order.order_products.build(product_id: params[:product_id], quantity: params[:order][:order_products][:quantity])
    else
      @order_product.quantity += params[:order][:order_products][:quantity].to_i
    end
    @order_product.save
    render :show
  end

  def update_product
    @order_product.update(quantity: params[:product][:order_products][:quantity].to_i)
    render json: { status: 'success'}
     
  end

  def delete_product
 
    @order_product.destroy
    render json: { status: 'success'}
  end

  private

  def setup_order_product
    current_order
    @order_product = current_order.order_products.find_by(product_id: params[:product_id])

     @order_products = current_order.order_products
      @order = []
      @quantity = []
      @count = []
      num = 0
        @order_products.each do |order|
          @order << order.product
          @count << order.quantity
          @quantity << order.product.price * order.quantity
          @total_count = num += order.quantity
        end

      sub = 0
        @quantity.each do |quantity|
          @total_price = sub += quantity
        end

  end

end