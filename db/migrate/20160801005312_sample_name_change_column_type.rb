class SampleNameChangeColumnType < ActiveRecord::Migration
  def change
    change_column(:resources, :readability, :string)
  end
end
