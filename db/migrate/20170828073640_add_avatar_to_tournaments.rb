class AddAvatarToTournaments < ActiveRecord::Migration[5.1]
  def change
    add_column :tournaments, :avatar, :string
  end
end
