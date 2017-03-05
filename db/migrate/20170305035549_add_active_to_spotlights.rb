class AddActiveToSpotlights < ActiveRecord::Migration
  def change
    add_column :spotlights, :active, :boolean
  end
end
