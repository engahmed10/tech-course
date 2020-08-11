class AddAdminColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean ,:default =>  flase, null: flase
    
  end
end
