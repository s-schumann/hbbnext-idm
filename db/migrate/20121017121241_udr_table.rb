class UdrTable < ActiveRecord::Migration
  def change
  	add_column :udrs, :user_id, :integer
  	add_column :udrs, :device_id, :integer
  end
end
