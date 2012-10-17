class Uuid < ActiveRecord::Migration
  def change
  	add_column :users, :uuid, :string
  	add_column :devices, :uuid, :string
  	add_column :contexts, :uuid, :string
  	add_column :udrs, :uuid, :string
  	add_column :crs, :uuid, :string
  end
end
