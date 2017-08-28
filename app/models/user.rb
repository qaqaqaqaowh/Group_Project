class User < ApplicationRecord
  include Clearance::User
  mount_uploader :avatar, AvatarUploader
  validates :email, uniqueness: true, on: [:create]
  validates :email, :password, :first_name, :last_name, presence: true, on: [:create]
  has_many :tournaments
  has_many :user_team_approvals
  has_many :authentications, dependent: :destroy
  has_and_belongs_to_many :teams

  def name
  	"#{self.first_name} #{self.last_name}"
  end

  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = self.create!(
      first_name: auth_hash["info"]["first_name"],
      last_name: auth_hash["info"]["last_name"],
      email: auth_hash["extra"]["raw_info"]["email"],
      password: SecureRandom.hex(6)
    )
    user.remote_avatar_url = auth_hash["info"]["image"].gsub('http://','https://')
    user.save!
    user.authentications << authentication
    return user
  end

  def fb_token
    x = self.authentications.find_by(provider: 'facebook')
    return x.token unless x.nil?
  end
end
