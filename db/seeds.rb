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

Skill.create(name: "Ruby")
Skill.create(name: "MySql")

UserSkill.create(user_id: 1, skill_id: 1)
UserSkill.create(user_id: 2, skill_id: 2)

SkillDetail.create(name: "Ruby on Rails", skill_id: 1)
SkillDetail.create(name: "Ruby other", skill_id: 1)
SkillDetail.create(name: "MySql 2", skill_id: 2)
SkillDetail.create(name: "MySQL 5", skill_id: 2)

UserSkillDetail.create(user_skill_id: 1, user_id: 1, skill_detail_id: 1)
UserSkillDetail.create(user_skill_id: 1, user_id: 1, skill_detail_id: 2)
UserSkillDetail.create(user_skill_id: 1, user_id: 1, skill_detail_id: 3)
UserSkillDetail.create(user_skill_id: 2, user_id: 2, skill_detail_id: 3)
UserSkillDetail.create(user_skill_id: 2, user_id: 2, skill_detail_id: 4)
