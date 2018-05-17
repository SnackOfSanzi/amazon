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
    Token.create(token: token.id, user_id: 1)


    #Token.create(token: token.id)
  end


  def pay
    @user = User.find(params[:user_id]).id
    @token = Token.find_by(user_id: @user).token
    Payjp.api_key = 'sk_test_a70e02e9371f1e6ce85a0bb7'
    charge = Payjp::Charge.create(
        :amount => 3000,
        :card => @token,
        :currency => 'jpy',
      )


      flash[:notice] = "支払い完了"

  end


end
