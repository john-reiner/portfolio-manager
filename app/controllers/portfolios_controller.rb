class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[ public ]
  before_action :authenticate_access, only: %i[ show edit update destroy ]

  # GET /portfolios/1 or /portfolios/1.json
  def show
    @skill_categories = @portfolio.skill_categories
  end

  def public

  end

  # GET /portfolios/new
  def new
    @new_portfolio = Portfolio.new
  end

  # GET /portfolios/1/edit
  def edit
  end

  # POST /portfolios or /portfolios.json
  def create

    @new_portfolio = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @new_portfolio.save

        secret_key = Rails.application.secret_key_base
        token = JWT.encode({
          portfolio_id: @new_portfolio.id,
          }, secret_key)
          session[:token] = token

        format.html { redirect_to portfolio_url(@new_portfolio), notice: "Portfolio was successfully created." }
        format.json { render :show, status: :created, location: @new_portfolio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @new_portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolios/1 or /portfolios/1.json
  def update
    
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to portfolio_url(@portfolio), notice: "Portfolio was successfully updated." }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_image
    image = ActiveStorage::Attachment.find(params[:image_id])
    if @portfolio == image.record
      image.purge
      redirect_to @portfolio
    else
      redirect_to @portfolio, notice: "Unable to delete that image"
    end
  end

  # DELETE /portfolios/1 or /portfolios/1.json
  def destroy
    @portfolio.destroy

    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: "Portfolio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_params
      params.require(:portfolio).permit( :email, :password, :password_confirmation, :welcome_message, :about_me_text, :image, :resume, :github, :linkedin )
    end
end
