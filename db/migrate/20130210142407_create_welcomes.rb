class CreateWelcomes < ActiveRecord::Migration
  def change
    create_table :welcomes do |t|
      t.text :content

      t.timestamps
    end
    add_index :welcomes, :content
  end
end
