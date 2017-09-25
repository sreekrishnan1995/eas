class Employee < ApplicationRecord
  before_save { self.emp_id = emp_id.downcase }
	validates :emp_id,  presence: true, length: { maximum: 21 },
                    uniqueness: { case_sensitive: false }
	validates :name,  presence: true, length: { maximum: 50 }

	
	has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def Employee.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
