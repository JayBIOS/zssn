class CreateSurvivors < ActiveRecord::Migration[5.0]
  def change
    create_table :survivors do |t|
      t.string :name
      t.integer :age
      t.integer :gender
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
