class AppraisalsController < ApplicationController

  def create
    @employee = Employee.find(params[:id])
    @appraisal = employee.appraisals.build(appraisal_params)
    if @appraisal.save
      flash[:success] = "Appraisal filled!"
      redirect_to employee_url
    else
      render '/employees'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appraisal
      @appraisal = Appraisal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appraisal_params
      params.require(:appraisal).permit(:technical_skills, :communication_skills, :inter_personal_skills, 
:attendance, :leadership, :self_rating, :employee_id)
    end
end
