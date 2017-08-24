class UserTeamApprovalsController < ApplicationController
	def index
		@team = Team.find(params[:format])
		@approvals = @team.user_team_approvals
	end

	def accept
		@approval = Approval.find(params[:id])
		@team = Team.find(@approval.team_id)
	end

	def decline
	end

end
