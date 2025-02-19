class EmployeesController < ApplicationController
  def index
    @employees = Employee.all.page params[:page]
  end
  def show
    @employee = Employee.find(params[:id])
  end
  def new
    @employee = Employee.new
    @roles = Role.all
    @departments = Department.all
  end
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path, notice: "Employee has been created successfully"
    else
      @roles = Role.all
      @departments = Department.all
      render :new, status: :unprocessable_entity # for validation is not displaying turbo_stream and data turbo
    end
  end
  def edit
   @employee = Employee.find(params[:id])
   @roles = Role.all
   @departments = Department.all
  end
  def update
   @employee = Employee.find(params[:id])
   if @employee.update(employee_params)
    redirect_to employees_path, notice: "Employee has been updated successfully"
   else
    @roles = Role.all
    @departments = Department.all
    render :edit, status: :unprocessable_entity
   end
  end
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path, notice: "Employee has been deleted successfully"
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :role_id, :department_id, :phone, :basic_pay, :allowances, :hire_date)
  end
end
