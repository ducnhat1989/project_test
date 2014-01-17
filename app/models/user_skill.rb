class UserSkill < ActiveRecord::Base
	belongs_to :skill
	has_many :user_skill_details
	accepts_nested_attributes_for :user_skill_details
end
