class SessionsController < ApplicationController

  def new
  end

  def create
    employee = Employee.find_by(emp_id: params[:session][:emp_id].downcase)
    if employee && employee.authenticate(params[:session][:password])
	log_in employee
	if @user=="HR"
    session[:user_HR]=1
		redirect_to employees_path
	elsif @user=="CEO"
    session[:user_CEO]=1
		redirect_to ceo_index_path
	elsif @user=="Project Manager"
    session[:user_PM]=1
		redirect_to projectmanager_index_path
	elsif@user=="Team Leader"
    session[:user_TL]=1
		redirect_to teamleader_index_path
	else
    session[:user_TM]=1
		redirect_to teammember_index_path
	end
    else
      flash.now[:danger] = 'Invalid emp_id/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    session[:user_CEO]=0
    session[:user_HR]=0
    session[:user_PM]=0
    session[:user_TM]=0
    session[:user_TL]=0
    redirect_to root_url
  end
end
