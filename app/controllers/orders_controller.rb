class OrdersController < ApplicationController
    before_action :setup_order_product, only: [:add_product, :update_product, :delete_product]

    def index

      @current = current_user.orders.last
       @order_products = @current.order_products
      @quantity = []
      @order = []
      num = 0
        @order_products.each do |order|
          @order << order
          @quantity << order.product.price * order.quantity
          @total_count = num += order.quantity
        end


      sub = 0
        @quantity.each do |quantity|
          @total_price = sub += quantity
        end


    end

  def show
    @order_product = current_order.order_products
  end

  def add_product
    if @order_product.blank?
      @order_product = current_order.order_products.build(params_order)
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

  def params_order
   params.require(:order).permit(order_products: [:quantity])[:order_products].merge(product_id: params[:product_id])
  end

  def setup_order_product
    current_order

    @order_product = current_order.order_products.find_by(product_id: params[:product_id])

  end

end
