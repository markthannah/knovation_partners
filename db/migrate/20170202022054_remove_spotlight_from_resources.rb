class RemoveSpotlightFromResources < ActiveRecord::Migration
  def change
    remove_column :resources, :spotlight, :string
  end
end
