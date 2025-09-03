class Major < ApplicationRecord
  has_many :teachers
  validates :major_name, presence: true, uniqueness: true
end
