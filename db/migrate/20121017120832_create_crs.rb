class CreateCrs < ActiveRecord::Migration
  def change
    create_table :crs do |t|

      t.timestamps
    end
  end
end
