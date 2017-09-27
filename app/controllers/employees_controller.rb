  class EmployeesController < ApplicationController
  before_action  :require_login, :require_HR

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])
    @appraisals = @employee.appraisals.paginate(page: params[:page])
  end

  def sele
    @employees = Employee.where(:superior_id => session[:user_id]).pluck(:emp_id)
    @appraisal=Appraisal.where(["emp_id in (?) and verified = ?",@employees,"f"])
  end

  def select
    @employees = Employee.where(["designation != ? and designation != ?","CEO","HR"]).order("designation ASC")
  end
  def view
    @employees = Employee.where(["designation != ? and designation != ?","CEO","HR"]).order("designation ASC")
  end

  def succ
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  def evaluate
    @appraisal = Appraisal.where(["verified = ? and evaluated = ?",'t','f'])
    @count=0
      @appraisal.each do |appraisal|
        appraisal.update_attribute(:evaluated,'t')
        @score=(appraisal.attendance / 3 )+appraisal.tech_skill+appraisal.comm_skill+appraisal.inter_skill+appraisal.decs_making+appraisal.lead_skill
        @score=@score/3
        @employee=Employee.find_by( emp_id: appraisal.emp_id)
        appraisal.update_attribute(:rating,@score)
        @score=0
        @s=0
        if @employee
          @appraisal1=Appraisal.where(emp_id: @employee.emp_id)
          @appraisal1.each do |appraisal1|
            @score=@score+appraisal1.rating
            @s=@s+1
          end
          @score=@score / @s
          @employee.update_attribute(:curr_rating, @score)
          @count=@count+1
        end
    end
  end


  # GET /employees/1/edit
  def edit
        @employee = Employee.find(params[:id])
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employees_succ_path}
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
        @employee = Employee.find(params[:id])

    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employees_path, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_succ_path}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:emp_id, :name, :designation, :superior_id, :password, 
:password_confirmation)
    end
end
