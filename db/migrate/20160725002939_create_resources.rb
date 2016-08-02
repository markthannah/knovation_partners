class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.text :description
      t.text :url
      t.string :lrt
      t.text :subject
      t.text :keyword
      t.string :author_publisher
      t.text :grade
      t.text :role
      t.integer :readability
      t.text :language
      t.text :standard

      t.timestamps null: false
    end
  end
end
