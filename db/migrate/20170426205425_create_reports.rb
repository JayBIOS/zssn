class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.references :infected, foreign_key: true
      t.references :by, foreign_key: true

      t.timestamps
    end
  end
end
