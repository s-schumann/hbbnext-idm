class CreateConsumers < ActiveRecord::Migration
  def change
    create_table :consumers do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
