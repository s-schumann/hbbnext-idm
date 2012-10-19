class RolesModel < ActiveRecord::Migration
  def change
    create_table :roles do |t|
	  t.integer :udr_id
	  t.string :uuid
      t.timestamps
    end
  end
end
