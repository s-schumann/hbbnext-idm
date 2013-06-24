class RemoveLastLogin < ActiveRecord::Migration
 def change
  	remove_column :udrs, :last_login
  	remove_column :crs, :last_login
  end
end
