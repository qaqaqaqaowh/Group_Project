class UserTeamApprovalsController < ApplicationController
	def index
		@team = Team.find(params[:format])
		@approvals = @team.user_team_approvals
	end

	def create
		@approval = UserTeamApproval.new(user_id: params[:user_id], team_id: params[:team_id])
		@approval.save
		redirect_to teams_path
	end

	def accept
		@approval = UserTeamApproval.find(params[:id])
		@team = Team.find(@approval.team_id)
		@user = User.find(@approval.user_id)
		@team.users << @user
		@approval.destroy
		redirect_to user_team_approvals_path(@team.id)
	end

	def decline
		@approval = UserTeamApproval.find(params[:id])
		@approval.destroy
		redirect_to user_team_approvals_path(@team.id)
	end

end
