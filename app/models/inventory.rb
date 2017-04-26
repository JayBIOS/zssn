class Inventory < ApplicationRecord
  has_many :stacks
  belongs_to :survivor
end
