class SkillsController < ApplicationController
  before_action :set_skill, only: %i[ show edit update destroy ]
  before_action :set_skill_category, only: %i[ index edit new create update]
  before_action :authenticate_access

  # GET /skills or /skills.json
  def index
    @skills = @skill_category.skills
  end
  
  # GET /skills/1 or /skills/1.json
  def show
    # byebug
  end
  
  # GET /skills/new
  def new
    @skill = @skill_category.skills.build
  end
  
  # GET /skills/1/edit
  def edit

  end

  # POST /skills or /skills.json
  def create

    @skill = @skill_category.skills.build(skill_params)

    respond_to do |format|
      if @skill.save
        format.turbo_stream
        format.html { redirect_to @portfolio, notice: "Skill was successfully created." }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@skill)}_form", partial: "form", locals: { portfolio: @portfolio, skill_category: @skill_category, skill: @skill })}
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skills/1 or /skills/1.json
  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to portfolio_skill_category_path(@portfolio, @skill_category), notice: "Skill was successfully updated." }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@skill)}_form", partial: "form", locals: { portfolio: @portfolio, skill_category: @skill_category, skill: @skill })}
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1 or /skills/1.json
  def destroy
    @skill.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("#{helpers.dom_id(@skill)}_item")}
      format.html { redirect_to skills_url, notice: "Skill was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_skill_category
      @skill_category = SkillCategory.find(params[:skill_category_id])
    end

    def set_skill
      @skill = Skill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def skill_params
      params.require(:skill).permit(:skill_category_id, :name, :icon)
    end
end
