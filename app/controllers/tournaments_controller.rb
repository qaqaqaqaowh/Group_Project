class TournamentsController < ApplicationController
	def index
		@tournaments = Tournament.all
	end

	def new
		@tournament = Tournament.new
	end

	def show
		@tournament = Tournament.find(params[:id])
	end

	def edit
		@tournament = Tournament.find(params[:id])
	end

	def create
		redirect_to tournament_path(@tournament)
	end

	def update
		@tournament = Tournament.find(params[:id])
		redirect_to tournament_path(@tournament)
	end

	def destroy
		@tournament = Tournament.find(params[:id])
		@tournament.destroy
		redirect_to tournaments_path
	end
end
