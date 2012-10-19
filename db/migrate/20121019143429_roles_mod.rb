class RolesMod < ActiveRecord::Migration
  def change
  	add_column :udrs, :role_id, :integer
  	remove_column :roles, :udr_id
  end
end
