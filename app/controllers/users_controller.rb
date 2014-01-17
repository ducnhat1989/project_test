class UsersController < ApplicationController
	before_action :signed_in_user

	def index
		@users = User.paginate page: params[:page], per_page: 1
	end

	def new
		@user = User.new
		@groups = Group.all
		Skill.all.each do |sk|
				@user.user_skills.build(skill_id: sk.id)
		end
	end

	def create
		@user = User.new user_params
		if @user.save
			flash[:notice] = "Successfully created user."
			redirect_to users_path
		else
			@user = User.new
			@groups = Group.all
			flash.now[:error_messages] = "Fail to created user."
			render 'new'
		end
	end

	private
    def user_params
	    params.require(:user).permit :name, :email, :password, :password_confirmation, user_skills_attributes: [:skill_id]
	  end
end