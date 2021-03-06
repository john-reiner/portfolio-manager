class SkillCategoriesController < ApplicationController
  before_action :set_skill_category, only: %i[ show edit update destroy ]
  before_action :authenticate_access

  # GET /skill_categories or /skill_categories.json
  def index
    @skill_categories = SkillCategory.all
  end

  # GET /skill_categories/1 or /skill_categories/1.json
  def show
    @skills = @skill_category.skills
  end
  # GET /skill_categories/new
  def new
    @skill_category = @portfolio.skill_categories.build
    @skill_category.skills.build
  end

  # GET /skill_categories/1/edit
  def edit
  end

  # POST /skill_categories or /skill_categories.json
  def create

    @skill_category = @portfolio.skill_categories.build(skill_category_params)

    respond_to do |format|
      if @skill_category.save
        format.turbo_stream
        format.html { redirect_to @portfolio, notice: "Skill category was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skill_categories/1 or /skill_categories/1.json
  def update
    respond_to do |format|
      if @skill_category.update(skill_category_params)
        format.html { redirect_to skill_category_url(@skill_category), notice: "Skill category was successfully updated." }
        format.json { render :show, status: :ok, location: @skill_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @skill_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skill_categories/1 or /skill_categories/1.json
  def destroy
    @skill_category.destroy

    respond_to do |format|
      format.html { redirect_to skill_categories_url, notice: "Skill category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill_category
      @skill_category = SkillCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def skill_category_params
      params.require(:skill_category).permit(:portfolio_id, :name)
    end
end
