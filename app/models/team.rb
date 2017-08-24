class Team < ApplicationRecord
	has_and_belongs_to_many :users
	has_many :tournament_team_approvs
  	has_many :tournaments, through: :tournament_team_approvs

end
