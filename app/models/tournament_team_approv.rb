class TournamentTeamApprov < ApplicationRecord
	belongs_to :tournaments
	belongs_to :teams
end
