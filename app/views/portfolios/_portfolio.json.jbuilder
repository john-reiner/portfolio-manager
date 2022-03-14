json.extract! portfolio, :id, :email, :welcome_message, :about_me_text, :github, :linkedin, :created_at, :updated_at
json.projects(portfolio.projects) do |project|
    json.id project.id
    json.name project.name
    json.description project.description
    json.github project.github
    json.url project.url
    json.main_image_url url_for(project.show_image)
    json.images(project.images) do |image|
        json.image_url url_for(image)
    end
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
json.image_url url_for(portfolio.image)
json.resume_url url_for(portfolio.resume)

json.url portfolio_url(portfolio, format: :json)
