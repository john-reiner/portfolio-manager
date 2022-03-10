json.extract! portfolio, :id, :email, :password_digest, :welcome_message, :about_me_text, :about_photo, :created_at, :updated_at
json.projects(portfolio.projects) do |project|
    json.id project.id
    json.name project.name
    json.description project.description
    json.github project.github
    json.url project.url
    json.main_image_url project.main_image_url
end

json.skills(portfolio.skill_categories) do |category|
    json.id category.id
    json.category category.name
    json.skills(category.skills) do |skill|
        json.id skill.id
        json.name skill.name
        json.icon skill.icon
    end
end

json.url portfolio_url(portfolio, format: :json)
