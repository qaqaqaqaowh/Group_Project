class Team < ApplicationRecord
	validates :user_id, presence: true
	validates :name, uniqueness: true
	has_many :user_team_approvals
	has_and_belongs_to_many :users
	has_and_belongs_to_many :tournaments
end
