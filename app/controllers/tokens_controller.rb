class TokensController < ApplicationController

  def new
  end

  def token
    Payjp.api_key = 'sk_test_a70e02e9371f1e6ce85a0bb7'
    token = Payjp::Token.create(
      :card => {
        :number => params[:number],
        :cvc => params[:cvc],
        :exp_month => params[:exp_month],
        :exp_year => params[:exp_year]
       }
     )
    Token.create(token: token.id, user_id: current_user.id)

    #Token.create(token: token.id)
  end

  def index
  end


  def pay
     @tokens = Token.where(user_id: current_user.id)
     @token = @tokens.last.token
    Payjp.api_key = 'sk_test_a70e02e9371f1e6ce85a0bb7'
    charge = Payjp::Charge.create(
        :amount => 3000,
        :card => @token,
        :currency => 'jpy',
      )


      flash[:notice] = "支払い完了"
  end


end
