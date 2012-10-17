class CreateContexts < ActiveRecord::Migration
  def change
    create_table :contexts do |t|
      t.string :alias
      t.string :display_name

      t.timestamps
    end
  end
end
