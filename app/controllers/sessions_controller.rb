class SessionsController < ApplicationController
  def new
  end

  def create
    employee = Employee.find_by(emp_id: params[:session][:emp_id].downcase)
    if employee && employee.authenticate(params[:session][:password])
	log_in employee
	redirect_to employee
    else
      flash.now[:danger] = 'Invalid emp_id/password combination'
      render 'new'
  end
end
