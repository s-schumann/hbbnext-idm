class UserAvatar < ActiveRecord::Migration
  def change
  	add_column :users, :avatar, :string
  end
end
