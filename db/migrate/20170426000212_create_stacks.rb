class CreateStacks < ActiveRecord::Migration[5.0]
  def change
    create_table :stacks do |t|
      t.integer :quantity
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
