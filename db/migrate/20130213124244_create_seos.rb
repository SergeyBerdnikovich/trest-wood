class CreateSeos < ActiveRecord::Migration
  def change
    create_table :seos do |t|
      t.text :keywords
      t.text :description
      t.integer :seo_object_id
      t.string :seo_object_type
      t.timestamps
    end
  end
end
