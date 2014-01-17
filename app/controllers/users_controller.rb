class UsersController < ApplicationController
	before_action :signed_in_user

	def index
		@users = User.paginate page: params[:page], per_page: 1
	end
end