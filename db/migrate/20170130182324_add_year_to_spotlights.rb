class AddYearToSpotlights < ActiveRecord::Migration
  def change
    add_column :spotlights, :year, :integer
  end
end
