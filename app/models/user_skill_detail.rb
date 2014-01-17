class UserSkillDetail < ActiveRecord::Base
	belongs_to :skill_detail
	belongs_to :user_skill
end
