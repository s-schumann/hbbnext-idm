class CreateUdrs < ActiveRecord::Migration
  def change
    create_table :udrs do |t|

      t.timestamps
    end
  end
end
