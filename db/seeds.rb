# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "Example User",email: "example@framgia.com",
password: "123456", password_confirmation: "123456")

User.create(name: "Nhat",email: "nhat@framgia.com",
password: "123456", password_confirmation: "123456")

Group.create(name: "Ruby")
Group.create(name: "MySql")

Skill.create(name: "Ruby on Rails", group_id: 1)
Skill.create(name: "Ruby other", group_id: 1)
Skill.create(name: "MySql 2", group_id: 2)
Skill.create(name: "MySQL 5", group_id: 2)

UserSkill.create(user_id: 1, skill_id: 1)
UserSkill.create(user_id: 1, skill_id: 2)
UserSkill.create(user_id: 1, skill_id: 3)
UserSkill.create(user_id: 2, skill_id: 3)
UserSkill.create(user_id: 2, skill_id: 4)
