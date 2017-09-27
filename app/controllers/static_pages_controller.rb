class StaticPagesController < ApplicationController
  def home
  end

  def pop

  	@employees=Employee.where(:emp_id=>session[:user_id])
  end

  def about
  end
end
