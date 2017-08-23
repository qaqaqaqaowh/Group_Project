class TeamsController < ApplicationController
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
		@team = Team.new(valid_params)
		if @team.save
			redirect_to team_path(@team)
		else
			render 'new'
		end
	end

	def update
		@team = Team.find(params[:id])
		if @team.update(valid_params)
			redirect_to team_path(@team)
		else
			render "edit"
		end
	end

	def destroy
		@team = Team.find(params[:id])
		@team.destroy
		redirect_to teams_path
	end
end

private
def valid_params
	params.require(:team).permit(:name, :description, :admin_id)
end