class Survivor < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :inventory, presence: true

  enum gender: [:male, :female]

  has_one :inventory, inverse_of: :survivor
  has_many :reports

  accepts_nested_attributes_for :inventory

  def infected?
    reports.length >= 3
  end
end
