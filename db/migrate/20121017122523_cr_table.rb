class CrTable < ActiveRecord::Migration
  def change
  	add_column :crs, :context_id, :integer
  	add_column :crs, :udr_id, :integer
  end
end
