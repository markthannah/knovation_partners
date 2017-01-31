class AddMonthToSpotlights < ActiveRecord::Migration
  def change
    add_column :spotlights, :month, :string
  end
end
