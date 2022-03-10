class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    
    def authenticate_access

        if session[:token]
            secret_key = Rails.application.secret_key_base
            decoded_token = JWT.decode(session[:token], secret_key)[0]
            @portfolio = Portfolio.find_by(id: decoded_token["portfolio_id"])
            if @portfolio == nil
                session[:token] = nil
                redirect_to root_path
            end
        # else
        #     redirect_to new_session_path
        end
    end
end
