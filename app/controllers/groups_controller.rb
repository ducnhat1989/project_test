class GroupsController < ApplicationController
	before_action :signed_in_user

	def show
		@group = Group.find params[:id]
		@skills = @group.skills
		render partial: "groups/skill", collection: @skills
	end
end