class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :category
      t.string :title
      t.string :description
      t.integer :coast
      t.string :material

      t.timestamps
    end
    add_index :items, :category_id
  end
end
