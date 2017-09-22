class Appraisal < ApplicationRecord
  belongs_to :employee
  default_scope -> { order(created_at: :desc) }
  validates :emp_id, presence: true
  validates :technical_skills, presence: true, length: { maximum: 140 }
end
