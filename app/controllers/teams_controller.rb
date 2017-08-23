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
		redirect_to team_path(@team)
	end

	def update
		@team = Team.find(params[:id])
		redirect_to team_path(@team)
	end

	def destroy
		@team = Team.find(params[:id])
		redirect_to teams_path
	end
end
