class AddSpotlightToResources < ActiveRecord::Migration
  def change
    add_column :resources, :spotlight, :string
  end
end
