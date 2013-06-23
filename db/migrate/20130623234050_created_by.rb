class CreatedBy < ActiveRecord::Migration
  def change
  	add_column :crs, :created_by, :string
  	add_column :contexts, :created_by, :string
  	add_column :devices, :created_by, :string
  	add_column :udrs, :created_by, :string
  	add_column :users, :created_by, :string
  end
end
