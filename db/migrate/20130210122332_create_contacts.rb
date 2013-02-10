class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.text :content

      t.timestamps
    end
    add_index :contacts, :content
  end
end
