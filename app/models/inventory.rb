class Inventory < ApplicationRecord
  has_many :stacks, inverse_of: :inventory
  belongs_to :survivor

  accepts_nested_attributes_for :stacks

  def value
    stacks.map(&:value).inject(0, :+)
  end

  def can_afford?(expense)
    expense.each do |stk|
      s = stacks.where(item_id: stk[:item].id).first
      return false if s.nil?
      return false unless s.quantity >= stk[:quantity]
    end

    true
  end
end
