class TeammemberController < ApplicationController


before_action  :require_login, :require_TM
def view
    @employees = Employee.where(:emp_id => session[:user_id])
  end
  def index

  	@sup = Employee.where(:emp_id => session[:sup_id])
  	@super = Employee.where(:emp_id => @sup[0].superior_id)
  end
end
