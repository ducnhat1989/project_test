class UsersController < ApplicationController
	before_action :signed_in_user

	def index
		@users = User.paginate page: params[:page], per_page: 1
	end

	def new
		if params[:g_id_check].present?
			@user = User.new name: params[:username], email: params[:email],
												password: params[:password] 
			#@skill_check = Skill.find params[:g_id_check]
			if session[:list_skills].include? params[:g_id_check]
				session[:list_skills].delete params[:g_id_check]
			else
				session[:list_skills] << params[:g_id_check].to_i
			end
			logger.info "1111//////////////////////////////////////////////"
			logger.info session[:list_skills].to_s
			Skill.all.each do |sk|
				@user_skill = @user.user_skills.build(skill_id: sk.id) 
				logger.info "3333//////////////////////////////////////////////"
						logger.info sk.id
				if session[:list_skills].include? sk.id
					logger.info "2222//////////////////////////////////////////////"
						logger.info session[:list_skills].to_s

					sk.skill_details.each do |sk_detail|
						@user_skill.user_skill_details.build(
							skill_detail_id: sk_detail.id)
					end
				end
			end
			render partial: "users/skill_form"
		else
			session[:list_skills] = Array.new
			@user = User.new
			Skill.all.each do |sk|
				@user_skill = @user.user_skills.build(skill_id: sk.id)
				# sk.skill_details.each do |sk_detail|
				# 	@user_skill.user_skill_details.build(skill_detail_id: sk_detail.id)
				# end
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