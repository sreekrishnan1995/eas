class ApplicationController < ActionController::Base



  protect_from_forgery with: :exception
  include SessionsHelper
  



def require_login
    if session[:employee_id].nil?
      flash[:danger]="Login First!"
      redirect_to controller:"sessions",action:"new" # halts request cycle
    end
  end

 def require_HR
      if session[:user_HR]==0
      	flash[:danger]="Access Denied!"
      	if session[:user_PM]==1
      		redirect_to projectmanager_index_path
      	elsif session[:user_TL]==1
      		redirect_to teamleader_index_path
      	elsif session[:user_TM]==1
      		redirect_to teammember_index_path
      	else session[:user_CEO]==1
      		redirect_to ceo_index_path
      end
  end
  end

     def require_PM
      if session[:user_PM]==0
      	flash[:danger]="Access Denied!"
      	if session[:user_HR]==1
      		redirect_to employees_path
      	elsif session[:user_TL]==1
      		redirect_to teamleader_index_path
      	elsif session[:user_TM]==1
      		redirect_to teammember_index_path
      	else session[:user_CEO]==1
      		redirect_to ceo_index_path
      end

      end
    end


     def require_TL
      if session[:user_TL]==0
        flash[:danger]="Access Denied!" 
      	if session[:user_HR]==1
      		redirect_to employees_path
      	elsif session[:user_PM]==1
      		redirect_to projectmanager_index_path
      	elsif session[:user_TM]==1
      		redirect_to teammember_index_path
      	else session[:user_CEO]==1
      		redirect_to ceo_index_path
      end

      end
    end

     def require_TM
      if session[:user_TM]==0
      	flash[:danger]="Access Denied!"
          if session[:user_HR]==1
      		redirect_to employees_path
      	elsif session[:user_PM]==1
      		redirect_to projectmanager_index_path
      	elsif session[:user_TL]==1
      		redirect_to teamleader_index_path
      	else session[:user_CEO]==1
      		redirect_to ceo_index_path
      end
      end
    end

 def require_CEO
      if session[:user_CEO]==0
         flash[:danger]="Access Denied!"
      		if session[:user_HR]==1
      		redirect_to employees_path
      	elsif session[:user_PM]==1
      		redirect_to projectmanager_index_path
      	elsif session[:user_TL]==1
      		redirect_to teamleader_index_path
      	else session[:user_TM]==1
      		redirect_to teammember_index_path
      end
       end 
    end
end
	