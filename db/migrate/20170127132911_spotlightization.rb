class Spotlightization < ActiveRecord::Migration
  def change
    create_table :spotlightizations do |t|
      t.integer :spotlight_id
      t.integer :resource_id

      t.timestamps null: false
    end
  end
end
