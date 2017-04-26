class Stack < ApplicationRecord
  validates :quantity, presence: true

  belongs_to :item
end
