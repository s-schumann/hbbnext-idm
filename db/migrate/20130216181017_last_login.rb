class LastLogin < ActiveRecord::Migration
  def change
  	add_column :udrs, :last_login, :datetime
  end
end
