class AddBioToSpotlights < ActiveRecord::Migration
  def change
    add_column :spotlights, :bio, :string
  end
end
