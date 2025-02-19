class LeavesController < ApplicationController
    before_action :set_leave, only: %i[approve reject]

    def create
      @leave = current_employee.leaves.new(leave_params)
      if @leave.save
        redirect_to employee_dashbord_path, notice: "Leave request submitted!"
      else
        render :new
      end
    end
    def approve
      @leave.update(status: "approved")
      redirect_to admin_dashbord_path, notice: "Leave approved!"
    end
    def reject
      @leave.update(status: "rejected")
      redirect_to admin_dashbord_path, notice: "Leave rejected!"
    end

    private

    def leave_params
      params.require(:leave).permit(:start_date, :end_date)
    end

    def set_leave
      @leave = Leave.find(params[:id])
    end
end
