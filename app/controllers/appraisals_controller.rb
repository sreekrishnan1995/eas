class AppraisalsController < ApplicationController
before_action :require_login
  def new
    @appraisal1 = Appraisal.where(:emp_id => session[:user_id]).pluck(:created_at)
    @appraisal1=@appraisal1.max
    if @appraisal1
      @appraisal1=Date.parse(@appraisal1.to_s)
      @s=Date.today
      if ( @s- @appraisal1).to_i > 15
        @appraisal = Appraisal.new
        @appraisal.emp_id=session[:user_id]
      else
      flash[:danger] = "#{15-(@s - @appraisal1).to_i} days remaining for next appraisal"
      end
      if session[:user_desig]=="HR"
        redirect_to employees_path
      elsif session[:user_desig]=="Project Manager"
        redirect_to projectmanager_index_path
      elsif session[:user_desig]=="Team Leader"
        redirect_to teamleader_index_path
      else
        redirect_to teammember_index_path
      end
    else
        @appraisal = Appraisal.new
        @appraisal.emp_id=session[:user_id]
    end
  end

  def show
    @appraisal = Appraisal.all
  end

  def edit
     @appraisal = Appraisal.find(params[:id])
  end


    def create

    @appraisal = Appraisal.new(appraisal_params)
    @appraisal.emp_id=session[:user_id]
    if @appraisal.save
      flash[:success] = "Appraisal filled!"
      if session[:user_desig]=="HR"
        redirect_to employees_path
      elsif session[:user_desig]=="Project Manager"
        redirect_to projectmanager_index_path
      elsif session[:user_desig]=="Team Leader"
        redirect_to teamleader_index_path
      else
        redirect_to teammember_index_path
      end
  end

end
  def update
    @appraisal = Appraisal.find(params[:id])
    if @appraisal.update(appraisal_params)
      flash[:success] = "Appraisal updated!"
      if session[:user_desig]=="HR"
        redirect_to employees_path
      elsif session[:user_desig]=="Project Manager"
        redirect_to projectmanager_index_path
      elsif session[:user_desig]=="Team Leader"
        redirect_to teamleader_index_path
      else
        redirect_to teammember_index_path
      end
  end
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appraisal
      @appraisal = Appraisal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appraisal_params
      params.require(:appraisal).permit(:emp_id,:attendance,  :comm_skill,:tech_skill,
        :inter_skill, :decs_making,  :lead_skill, :rating, :verified )
    end
end
