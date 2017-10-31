class AddAdminToUsers < ActiveRecord::Migration[5.1]
  def change
    #table|column|type|option
    add_column :users, :admin, :boolean, default: false
  end
end
