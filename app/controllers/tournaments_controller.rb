class TournamentsController < ApplicationController
	before_action :require_login

	def index
		@tournaments = Tournament.all
	end

	def new
		@tournament = Tournament.new
	end

	def create
		# byebug
		@tournament = Tournament.new(valid_params)
		if @tournament.save
			if params[:tournament][:file]
				@tournament.avatar = params[:tournament][:file]
				@tournament.save!
			end
			redirect_to tournaments_path
		else
			render 'new'
		end
	end

	def show
		@tournament = Tournament.find(params[:id])
		@team = Team.find_by_user_id(current_user.id)
	end

	def edit
		@tournament = Tournament.find(params[:id])
	end

	def update
		@tournament = Tournament.find(params[:id])
		if @tournament.update(valid_params)
			if params[:tournament][:file]
				@tournament.avatar = params[:tournament][:file]
				@tournament.save!
			end
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

	def sport
	end

	def sports
  end

	def join
		@team=Team.find_by_user_id(current_user.id)
		@tournament=Tournament.find(params[:id])
		@tournament_team=TournamentTeamApprov.new(team_id:@team.id,tournament_id:@tournament.id,payment_status:false, approval:false )
		@tournament_team.save
 		@tournament_team=TournamentTeamApprov.find_by_team_id_and_tournament_id(@team.id,@tournament.id)
 		# byebug
 		redirect_to payment_new_path(team_id: @team.id,tournament_id:@tournament.id,total:@tournament.fee)

 		# @tournament_team.update(payment_status:false,approval:false)
	end

	def approve
		# byebug
		@tournament=Tournament.find(params[:tournament_id])
		@team=Team.find(params[:team_id])
		if @tournament.user_id==current_user.id

			# byebug
			@tournament_team=TournamentTeamApprov.find_by_team_id_and_tournament_id(@team.id,@tournament.id)
			@tournament_team.update(approval:params[:approval])
		end
		redirect_to tournament_path
	end

	def remove_team
		@tournament_team = Tournament.find_by(team_id: params[:team_id], tournament_id: params[:tournament_id])
		@tournament_team.destroy
		redirect_to tournament_path(@tournament)
	end
end

private
def valid_params
	params.require(:tournament).permit(:location, :start_date, :end_date, :fee, :category, :title, :description, :rules, :sport, :user_id, :num_teams, :num_players)
end
