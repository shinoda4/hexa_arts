class Education < ApplicationRecord
  validates :education_name, presence: { message: "学历名称必须填写" },
            uniqueness: { message: "学历已存在，请勿重复" }
end
