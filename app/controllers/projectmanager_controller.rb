class ProjectmanagerController < ApplicationController

before_action  :require_login, :require_PM

  def view
    id = Employee.where(["superior_id = ?",session[:user_id]]).pluck(:emp_id)
    @employees = Employee.where(["superior_id in (?) or superior_id = ?",id,session[:user_id]])
  end
  def index
  	@teaml=[]

    @sup = Employee.where(:emp_id => session[:sup_id])
    @team = Employee.where(:superior_id =>session[:user_id])

    for t in @team
      @t1 = Employee.where(:superior_id => t.emp_id)
     @teaml= @teaml.push @t1

    end
  end

  def myview
      @employees = Employee.where(:emp_id => session[:user_id])
  end

  def select
  	@employees = Employee.where(:superior_id => session[:user_id]).pluck(:emp_id)
  	@appraisal=Appraisal.where(["emp_id in (?) and verified = ?",@employees,"f"])
  end
end
