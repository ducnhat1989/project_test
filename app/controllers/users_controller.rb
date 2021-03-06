class UsersController < ApplicationController
	before_action :signed_in_user

	def index
		@users = User.paginate page: params[:page], per_page: 1
	end

	def new
		@user = User.new
		if params[:g_id_check].present?
			# skill = Skill.find params[:g_id_check]
			# @user_skill = @user.user_skills.build(skill_id: params[:g_id_check])
			# skill.skill_details.each do |sk_detail|
			# 	@user_skill.user_skill_details.build(skill_detail_id: sk_detail.id)
			# end
			# render partial: "skill_temp_form"
			Skill.all.each do |sk|
				@user_skill = @user.user_skills.build(skill_id: sk.id)
				sk.skill_details.each do |sk_detail|
					@user_skill.user_skill_details.build(skill_detail_id: sk_detail.id)
				end
			end
			render partial: "skill_temp_form"
		else
			Skill.all.each do |sk|
				@user_skill = @user.user_skills.build(skill_id: sk.id)
			end
		end
	end

	def create
		@user = User.new user_params
		if @user.save
			flash[:notice] = "Successfully created user."
			redirect_to users_path
		else
			@user = User.new
			flash.now[:error_messages] = "Fail to created user."
			redirect_to users_path
		end
	end

	private
    def user_params
	    params.require(:user).permit :name, :email, :password, :password_confirmation, 
	      user_skills_attributes: [:skill_id, 
	    		user_skill_details_attributes: [:skill_detail_id]]
	  end
end