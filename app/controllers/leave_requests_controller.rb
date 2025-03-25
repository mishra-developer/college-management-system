class LeaveRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_leave_request, only: [:show, :edit, :update, :destroy]

  def index
    @leaves = current_user.leave_requests
    if current_user.role == 'Teacher'
      @leaves = LeaveRequest.where(approval_id: current_user.id)
    end
  end

  def show
  end

  def new
    @leave = current_user.leave_requests.new
  end

  def create
    @leave = current_user.leave_requests.new(leave_request_params)

    if @leave.save
      redirect_to leave_requests_path, notice: 'Leave request was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @leave.update(leave_request_params)
      redirect_to leave_requests_path, notice: 'Leave request was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @leave.destroy
    redirect_to leave_requests_path, notice: 'Leave request was successfully deleted.'
  end

  private

  def set_leave_request
    @leave = LeaveRequest.find(params[:id])
  end

  def leave_request_params
    params.require(:leave_request).permit(:form_date, :to_date, :reason, :leave_type, :request_id, :approval_id, :status)
  end
end
