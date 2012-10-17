class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :alias
      t.string :display_name
      t.string :address

      t.timestamps
    end
  end
end
