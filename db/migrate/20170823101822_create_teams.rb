class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
    	t.string :name
    	t.integer :admin_id
    	t.string :description

      t.timestamps
    end
  end
end
