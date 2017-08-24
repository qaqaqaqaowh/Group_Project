class AddUserIdToTournaments < ActiveRecord::Migration[5.1]
  def change
  	add_column :tournaments, :user_id, :integer
  	remove_column :tournaments, :admin_id


  end
end
