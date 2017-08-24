class User < ApplicationRecord
  include Clearance::User
  validates :email, uniqueness: true
  validates :email, :password, :first_name, :last_name, presence: true
  has_many :tournaments
  has_and_belongs_to_many :teams
end
