class UdrRoleCrState < ActiveRecord::Migration
  def change
  	add_column :crs, :active, :boolean
  	add_column :udrs, :role, :string
  end
end
