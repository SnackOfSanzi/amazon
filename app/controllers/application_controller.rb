class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

    helper_method :current_order

  def current_order
    if session[:order_id]
      @order = Order.find(session[:order_id])
    else
      @order = Order.create(user_id: current_user.id)
      session[:order_id] = @order.id
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  protected

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end

