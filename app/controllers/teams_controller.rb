class TeamsController < ApplicationController
	before_action :require_login

	def index
		@teams = Team.all
	end

	def new
		@team = Team.new
	end

	def edit
		@team = Team.find(params[:id])
	end

	def show
		@team = Team.find(params[:id])
	end

	def create
		@team = Team.new(team_params)
		@team.user_id = current_user.id
		if @team.save
			if params[:team][:file]
				@team.avatar = params[:team][:file]
				@team.save!
			end
			redirect_to team_path(@team)
		else
			render 'new'
		end
	end

	def update
		@team = Team.find(params[:id])
		if @team.update(edit_params)
			if params[:team][:file]
				@team.avatar = params[:team][:file]
				@team.save!
			end
			redirect_to team_path(@team)
		else
			render "edit"
		end
	end

	def destroy
		@team = Team.find(params[:id])
		@team.users.delete
		@team.destroy
		redirect_to teams_path
	end

	def deletemember
		@team = Team.find(params[:team_id])
		@user = User.find(params[:user_id])
		@team.users.delete(@user)
		redirect_to team_path(@team)
	end
end

private
def team_params
	params.require(:team).permit(:name, :description)
end

def edit_params
	params.require(:team).permit(:name, :description, :user_id)
end
