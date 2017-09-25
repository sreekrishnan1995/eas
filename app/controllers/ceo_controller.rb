class CeoController < ApplicationController
	before_action :require_login, :require_CEO
	def view
    @employees = Employee.where(["designation != ? and designation != ?","CEO","HR"])
    
  end
  def index
  	
  end
end
