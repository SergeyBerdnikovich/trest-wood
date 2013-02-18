class ChangeCostType < ActiveRecord::Migration
  def up
    change_column :items, :cost, :string
  end

  def down
    change_column :my_table, :cost, :integer
  end
end
