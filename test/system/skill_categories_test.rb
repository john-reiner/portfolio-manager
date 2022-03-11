require "application_system_test_case"

class SkillCategoriesTest < ApplicationSystemTestCase
  setup do
    @skill_category = skill_categories(:one)
  end

  test "visiting the index" do
    visit skill_categories_url
    assert_selector "h1", text: "Skill categories"
  end

  test "should create skill category" do
    visit skill_categories_url
    click_on "New skill category"

    fill_in "Name", with: @skill_category.name
    fill_in "Portfolio", with: @skill_category.portfolio_id
    click_on "Create Skill category"

    assert_text "Skill category was successfully created"
    click_on "Back"
  end

  test "should update Skill category" do
    visit skill_category_url(@skill_category)
    click_on "Edit this skill category", match: :first

    fill_in "Name", with: @skill_category.name
    fill_in "Portfolio", with: @skill_category.portfolio_id
    click_on "Update Skill category"

    assert_text "Skill category was successfully updated"
    click_on "Back"
  end

  test "should destroy Skill category" do
    visit skill_category_url(@skill_category)
    click_on "Destroy this skill category", match: :first

    assert_text "Skill category was successfully destroyed"
  end
end
