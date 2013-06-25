class DeviceUniqueId < ActiveRecord::Migration
  def change
  	add_column :devices, :uniqueid, :string
  end
end
