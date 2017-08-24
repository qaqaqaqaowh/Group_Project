class User < ApplicationRecord
  include Clearance::User
  validates :email, uniqueness: true
  validates :email, :password, :first_name, :last_name, presence: true
  has_many :tournaments
  has_many :user_team_approvals
  has_and_belongs_to_many :teams

  def name
  	"#{self.first_name} #{self.last_name}"
  end
end
