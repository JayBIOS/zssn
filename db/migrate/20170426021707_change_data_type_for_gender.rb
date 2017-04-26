class ChangeDataTypeForGender < ActiveRecord::Migration[5.0]
  def change
    change_column(:survivors, :gender, :integer)
  end
end
