class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :alias
      t.string :username
      t.string :password
      t.string :pin

      t.timestamps
    end
  end
end
