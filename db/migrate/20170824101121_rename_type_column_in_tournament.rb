class RenameTypeColumnInTournament < ActiveRecord::Migration[5.1]
  def change
	rename_column :tournaments, :type, :category
  end
end
