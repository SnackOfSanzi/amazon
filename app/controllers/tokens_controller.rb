class TokensController < ApplicationController

  def new
  end

  def token
    Payjp.api_key = 'pk_test_1bd65f74de4d0be46949ad88'
    token = Payjp::Token.create(
      :card => {
        :number => params[:number],
        :cvc => params[:cvc],
        :exp_month => params[:exp_month],
        :exp_year => params[:exp_year]
       }
     )
    Token.create(token: token.id, user_id: current_user.id)


  end

  def index
  end


  def pay
      @tokens = Token.where(user_id: current_user.id)
      @token = @tokens.last.token
      @current = current_user.orders.last
      @order_products = @current.order_products
      @quantity = []
      @order_products.each do |order|
        @quantity << order.product.price * order.quantity
      end

      sub = 0
      @quantity.each do |quantity|
        @total_price = sub += quantity
      end

    Payjp.api_key = 'sk_test_f6fb174ceb7bc83bab497a79'
    charge = Payjp::Charge.create(
        :amount => @total_price,
        :card => @token,
        :currency => 'jpy',
      )
      @order_products.delete_all

      flash[:notice] = "支払い完了"
  end


end
