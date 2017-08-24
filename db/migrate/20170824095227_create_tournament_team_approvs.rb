class CreateTournamentTeamApprovs < ActiveRecord::Migration[5.1]
  def change
    create_table :tournament_team_approvs do |t|
      t.boolean :approval
      t.boolean :payment_status
      t.belongs_to :team, index: true
      t.belongs_to :tournament, index: true
      t.timestamps
    end
  end
end
