class AddLexileToResources < ActiveRecord::Migration
  def change
    add_column :resources, :lexile, :string
  end
end
