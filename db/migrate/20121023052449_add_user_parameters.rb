class AddUserParameters < ActiveRecord::Migration
  def change
  	add_column :users, :mmi_voice, :string
  	add_column :users, :mmi_face, :string
  	add_column :users, :gender, :string
  	add_column :users, :birthday, :date
  	add_column :users, :email, :string
  end
end
