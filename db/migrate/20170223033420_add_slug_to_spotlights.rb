class AddSlugToSpotlights < ActiveRecord::Migration
  def change
    add_column :spotlights, :slug, :string
    add_index :spotlights, :slug, unique: true
  end
end
