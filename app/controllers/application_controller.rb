class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    helper_method :current_order

  def current_order
    if session[:order_id]
      @order = Order.find(session[:order_id])
    else
      @order = Order.create
      session[:order_id] = @order.id
      
    end

  end
end
