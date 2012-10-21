class AccessToken < ActiveRecord::Migration
  def change
  	add_column :consumers, :access_token, :string
  end
end
