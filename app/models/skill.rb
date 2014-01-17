class Skill < ActiveRecord::Base
	has_many :skill_details
	has_many :user_skills
end
