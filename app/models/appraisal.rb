class Appraisal < ApplicationRecord
  
  default_scope -> { order(created_at: :desc) }
  validates :emp_id, presence: true
  validates :tech_skill, presence: true, length: { maximum: 140 }
end
