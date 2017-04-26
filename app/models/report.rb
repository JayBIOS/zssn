class Report < ApplicationRecord
  validates :infected, uniqueness: { scope: :by }

  belongs_to :infected, class_name: 'Survivor'
  belongs_to :by, class_name: 'Survivor'
end
