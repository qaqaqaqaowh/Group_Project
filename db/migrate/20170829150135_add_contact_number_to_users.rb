class AddContactNumberToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :number, :string
  end
end
