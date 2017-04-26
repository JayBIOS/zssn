class Stack < ApplicationRecord
  validates :quantity, presence: true

  belongs_to :inventory
  belongs_to :item
end
