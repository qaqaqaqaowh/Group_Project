class CreateTournaments < ActiveRecord::Migration[5.1]
  def change
    create_table :tournaments do |t|
    	t.string :location
    	t.date :start_date
    	t.date :end_date
    	t.string :type
    	t.integer :winning_team_id
    	t.string :title
    	t.string :description
    	t.string :rules
    	t.integer :fee
    	t.string :sport
    	t.integer :admin_id

      t.timestamps
    end
  end
end
