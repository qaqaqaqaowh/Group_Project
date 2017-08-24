class CreateUserTeamApprovals < ActiveRecord::Migration[5.1]
  def change
    create_table :user_team_approvals do |t|
  		t.integer :user_id
  		t.integer :team_id
    	t.timestamps
    end
  end
end
