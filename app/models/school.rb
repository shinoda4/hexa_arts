class School < ApplicationRecord
  validates :school_name, presence: true, uniqueness: true
end
