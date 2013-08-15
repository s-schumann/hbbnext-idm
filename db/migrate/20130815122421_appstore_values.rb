class AppstoreValues < ActiveRecord::Migration
  def change
  	add_column :users, :pref_price, :string
  	add_column :users, :pref_usability, :string
  	add_column :users, :pref_responsiveness, :string
  end
end
