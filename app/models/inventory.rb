class Inventory < ApplicationRecord
  has_many :stacks, inverse_of: :inventory
  belongs_to :survivor

  accepts_nested_attributes_for :stacks

  def value
    stacks.map(&:value).inject(0, :+)
  end
end
