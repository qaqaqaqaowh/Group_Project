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
		@tournament = Tournament.new(valid_params)
		if @tournament.save
			redirect_to tournament_path(@tournament)
		else
			render 'new'
		end
	end

	def update
		@tournament = Tournament.find(params[:id])
		if @tournament.update(valid_params)
			redirect_to tournament_path(@tournament)
		else
			render 'edit'
		end
	end

	def destroy
		@tournament = Tournament.find(params[:id])
		@tournament.destroy
		redirect_to tournaments_path
	end
end

private
def valid_params
	params.require(:tournament).permit(:location, :start_date, :end_date, :fee, :type, :title, :description, :rules, :sport, :admin_id)
end