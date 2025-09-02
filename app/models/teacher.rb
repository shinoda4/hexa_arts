class Teacher < ApplicationRecord
  belongs_to :school
  belongs_to :major
  belongs_to :education
  has_one_attached :photo
end
