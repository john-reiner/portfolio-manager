class MessagesController < ApplicationController

    before_action :set_message, only: %i[ show destroy ]

    def index
        @messages = Message.all
    end

    def show
    end

    def create

        @message = Message.new(message_params)
        @message.portfolio_id = params['portfolio_id']
        respond_to do |format|
            if @message.save
                format.html { redirect_to message_url(@message), notice: "Message was successfully created." }
                format.json { render json: @message }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @message.errors, status: :unprocessable_entity }
            end
        end
    end    

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
        @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
        params.require(:message).permit(:portfolio_id, :name, :email, :message)
    end
end
