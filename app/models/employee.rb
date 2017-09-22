class Employee < ApplicationRecord
  before_save { self.emp_id = emp_id.downcase }
	validates :emp_id,  presence: true, length: { maximum: 21 },
                    uniqueness: { case_sensitive: false }
	validates :name,  presence: true, length: { maximum: 50 }

	has_many :appraisals
	has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
