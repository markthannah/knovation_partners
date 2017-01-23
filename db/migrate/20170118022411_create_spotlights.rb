class CreateSpotlights < ActiveRecord::Migration
  def change
    create_table :spotlights do |t|
      t.string :description
      t.string :title
      t.string :publisher
      t.string :icon
      t.string :description_title

      t.timestamps null: false
    end
  end
end
