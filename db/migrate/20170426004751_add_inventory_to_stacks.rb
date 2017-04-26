class AddInventoryToStacks < ActiveRecord::Migration[5.0]
  def change
    add_reference :stacks, :inventory, foreign_key: true
  end
end
