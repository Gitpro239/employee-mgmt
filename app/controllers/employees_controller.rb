class EmployeesController < ApplicationController
  def index
    @q = Employee.ransack(params[:q])
    @employees = @q.result(distinct: true).page(params[:page])
    # @employees = Employee.all.page(params[:page])
    # filter_employees
    # if params[:search_query].present?
    #   @employees = Employee.where("name LIKE ?", "%#{params[:search_query]}%")
    # else
    #   @employees = Employee.all
    # end
  end

  def show
    @employee = Employee.find(params[:id])
  end
  def new
    @employee = Employee.new
    @roles = Role.all
    # @departments = Department.all
  end
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path, notice: "Employee has been created successfully"
    else
      @roles = Role.all
      # @departments = Department.all
      render :new, status: :unprocessable_entity # for validation is not displaying turbo_stream and data turbo
    end
  end
  def edit
   @employee = Employee.find(params[:id])
   @roles = Role.all
    #  @departments = Department.all
  end
  def update
   @employee = Employee.find(params[:id])
   if @employee.update(employee_params)
    redirect_to employees_path, notice: "Employee has been updated successfully"
   else
    @roles = Role.all
    # @departments = Department.all
    render :edit, status: :unprocessable_entity
   end
  end
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path, notice: "Employee has been deleted successfully"
    # data: {turbo_method: :delete, turbo_confirm: "Are you sure?"}
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :gender, :role_id, :department_id, :phone, :basic_pay, :allowances, :hire_date)
  end

  def filter_employees
    @employees = @employees.by_department(params[:department]) if params[:department].present?
    @employees = @employees.by_role(params[:role]) if params[:role].present?
    @employees = @employees.by_hire_date(params[:hire_date]) if params[:hire_date].present?
  end
end
