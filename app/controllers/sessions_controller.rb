class SessionsController < ApplicationController

  def login

    portfolio = Portfolio.find_by(email: params[:email])
    if portfolio and portfolio.authenticate(params[:password])
      secret_key = Rails.application.secret_key_base
      token = JWT.encode({
        portfolio_id: portfolio.id,
        }, secret_key)
        session[:token] = token

        redirect_to portfolio
    else
      flash[:message] = "Unable to verify email or password please try again."

    end
  end

  def logout
    session[:token] = nil
    redirect_to root_path
  end
end
