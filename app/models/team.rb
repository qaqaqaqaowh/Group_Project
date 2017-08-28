class Team < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
	validates :user_id, presence: true
	validates :name, uniqueness: true, on: [:create]
	has_many :user_team_approvals
	has_and_belongs_to_many :users
	has_many :tournament_team_approvs
  	has_many :tournaments, through: :tournament_team_approvs

end
