class NamesForConnectingModels < ActiveRecord::Migration
  def change
  	add_column :crs, :name, :string
  	add_column :udrs, :name, :string
  end
end
