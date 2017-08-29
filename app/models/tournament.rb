class Tournament < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
	belongs_to :user
	validates :location, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :category, presence: true
	validates :title, presence: true
	validates :sport, presence: true
	validates :num_teams, presence: true
	validates :num_players, presence: true
	has_many :tournament_team_approvs
  	has_many :teams, through: :tournament_team_approvs
  	default_scope -> { order(start_date: :asc) }
end
