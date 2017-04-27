class Stack < ApplicationRecord
  validates :quantity, presence: true

  belongs_to :inventory
  belongs_to :item

  def value
    item.value * quantity
  end
end
