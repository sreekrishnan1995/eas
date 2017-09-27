  class TeamleaderController < ApplicationController

before_action  :require_login, :require_TL

def view
    @employees = Employee.where(["superior_id = ?",session[:user_id]])
  end
  def index

    @sup = Employee.where(:emp_id => session[:sup_id])
    @team = Employee.where(:superior_id =>session[:user_id])
  	
  end
  def myview
  	  @employees = Employee.where(:emp_id => session[:user_id])
  end

  def select
    @employees = Employee.where(:superior_id => session[:user_id]).pluck(:emp_id)
  	@appraisal=Appraisal.where(["emp_id in (?) and verified = ?",@employees,"f"])
  end
end
