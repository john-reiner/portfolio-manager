# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Portfolio.create!(
    email: "johnnyreiner@gmail.com",
    password: "password",
    welcome_message: "Hi! I'm John.",
    about_me_text: "This is coming from my rails api portfolio manager!",
)

Project.create!(
    portfolio_id: 1,
    name: "My Portfolio",
    description: "My portfolio which you are currently vieing! This was built on a React front end client connecting to my Portfolio Manager which send the JSON information. Please see my other project 'Portfolio Manger' for more information.",
    github: "https://github.com/john-reiner/portfolio-react",
    url: '/',
    main_image_url: "./assets/images/portfolio-main.png"
)

SkillCategory.create!(
    name: "Languages",
    portfolio_id: 1,

)
SkillCategory.create!(
    name: "Frameworks",
    portfolio_id: 1,
    
)
SkillCategory.create!(
    name: "Technologies",
    portfolio_id: 1,
    
)

Skill.create!(
    name: "Ruby", icon: "logos:ruby", skill_category_id: 1
)
Skill.create!(
    name: "JavaScript", icon: "logos:javascript", skill_category_id: 1
)
Skill.create!(
    name: "Node JS", icon: "vscode-icons:file-type-node", skill_category_id: 1
)
Skill.create!(
    name: "Python", icon: "vscode-icons:file-type-python", skill_category_id: 1
)
Skill.create!(
    name: "HTML", icon: "logos:html-5", skill_category_id: 1
)
Skill.create!(
    name: "CSS", icon: "logos:css-3", skill_category_id: 1
)

Message.create!(
    name: "Test Sender",
    email: "testsender@test.com",
    message: "testing get requests",
    portfolio_id: 1
)