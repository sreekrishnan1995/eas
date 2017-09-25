module SessionsHelper

 def log_in(employee)
    session[:employee_id] = employee.id
    session[:user_id] = employee.emp_id
    session[:user_desig] = employee.designation
	@user=employee.designation
  end

  def current_employee
    @current_employee ||= Employee.find_by(id: session[:employee_id])
  end

  def logged_in?
    !current_employee.nil?
  end

  def log_out
    session.delete(:employee_id)
    @current_employee = nil
  end
end
