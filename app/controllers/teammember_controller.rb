class TeammemberController < ApplicationController


before_action  :require_login, :require_TM
def view
    @employees = Employee.where(:emp_id => session[:user_id])
  end
  def index
  end
end
