class LastLogin2 < ActiveRecord::Migration
  def change
  	add_column :crs, :last_login, :datetime
  end
end
