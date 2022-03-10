class PagesController < ApplicationController

    before_action :authenticate_access

    def home
        # byebug
        if @portfolio
            redirect_to @portfolio
        end
    end

end
