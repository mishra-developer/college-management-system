class LeaveRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_leave_request, only: [:show, :edit, :update, :destroy, :update_status]

  def index
    @leaves = current_user.leave_requests
    @total_leaves = current_user.leave_requests.count
    @total_approved_leaves = current_user.leave_requests.where(status: :approved).count
    @total_pending_leaves = current_user.leave_requests.where(status: :pending).count
    @total_cancelled_leaves = current_user.leave_requests.where(status: :cancelled).count

    @leaves = LeaveRequest.all
    @total_leaves = LeaveRequest.all.count
    @total_approved_leaves = LeaveRequest.where( status: :approved).count
    @total_pending_leaves = LeaveRequest.where( status: :pending).count
    @total_cancelled_leaves = LeaveRequest.where( status: :cancelled).count

    if current_user.role == 'Teacher'
      @leaves = LeaveRequest.where(approval_id: current_user.id)
      @total_leaves = LeaveRequest.where(approval_id: current_user.id).count
      @total_approved_leaves = LeaveRequest.where(approval_id: current_user.id, status: :approved).count
      @total_pending_leaves = LeaveRequest.where(approval_id: current_user.id, status: :pending).count
      @total_cancelled_leaves = LeaveRequest.where(approval_id: current_user.id, status: :cancelled).count
    end

    if current_user.role == 'SuperAdmin'
      @leaves = LeaveRequest.all
      @total_leaves = LeaveRequest.all.count
      @total_approved_leaves = LeaveRequest.where(status: :approved).count
      @total_pending_leaves = LeaveRequest.where( status: :pending).count
      @total_cancelled_leaves = LeaveRequest.where( status: :cancelled).count
    end

    if current_user.role == 'Parent'
      student = current_user.students.first
      @leaves = LeaveRequest.where(user_id: student.id)
      @total_leaves = LeaveRequest.where(user_id: student.id).count
      @total_approved_leaves = LeaveRequest.where(user_id: student.id, status: :approved).count
      @total_pending_leaves = LeaveRequest.where(user_id: student.id, status: :pending).count
      @total_cancelled_leaves = LeaveRequest.where(user_id: student.id, status: :cancelled).count
    end

    if current_user.role == 'Teacher'
      @leaves = LeaveRequest.where(approval_id: current_user.id)
      @total_leaves = LeaveRequest.where(approval_id: current_user.id).count
      @total_approved_leaves = LeaveRequest.where(approval_id: current_user.id, status: :approved).count
      @total_pending_leaves = LeaveRequest.where(approval_id: current_user.id, status: :pending).count
      @total_cancelled_leaves = LeaveRequest.where(approval_id: current_user.id, status: :cancelled).count
    end
  end

  def show
    @total_leaves = current_user.leave_requests.count
    @total_approved_leaves = current_user.leave_requests.where(status: :approved).count
    @total_pending_leaves = current_user.leave_requests.where(status: :pending).count
    @total_cancelled_leaves = current_user.leave_requests.where(status: :cancelled).count

    if current_user.role == 'Teacher'
      @leaves = LeaveRequest.where(approval_id: current_user.id)
      @total_leaves = LeaveRequest.where(approval_id: current_user.id).count
      @total_approved_leaves = LeaveRequest.where(approval_id: current_user.id, status: :approved).count
      @total_pending_leaves = LeaveRequest.where(approval_id: current_user.id, status: :pending).count
      @total_cancelled_leaves = LeaveRequest.where(approval_id: current_user.id, status: :cancelled).count
    end

    if current_user.role == 'SuperAdmin'
      @leaves = LeaveRequest.all
      @total_leaves = LeaveRequest.where(user_id: @leave.user.id).count
      @total_approved_leaves = LeaveRequest.where(status: :approved, user_id: @leave.user.id).count
      @total_pending_leaves = LeaveRequest.where( status: :pending, user_id: @leave.user.id).count
      @total_cancelled_leaves = LeaveRequest.where( status: :cancelled, user_id: @leave.user.id).count
    end
  end

  def new
    @leave = current_user.leave_requests.new
    @students = Student.all
  end

  def create
    @leave = current_user.leave_requests.new(leave_request_params)

    if @leave.save
      redirect_to leave_requests_path, notice: 'Leave request was successfully created.'
    else
      render :new
    end
  end

  def apply_early_leave
    @leave = current_user.leave_requests.new
    @students = Student.all
  end

  def create_early_leave
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

  def update_status
    if @leave.update(status: params[:status])
      redirect_to leave_request_path(@leave), 
                  notice: "Leave request was successfully #{params[:status]}."
       UserMailer.send_email_update_status(@leave, @leave.user).deliver_now
       UserMailer.send_email_for_early_leave_approval(@leave).deliver_now if @leave.transport.present?
    else
      redirect_to leave_request_path(@leave),
                  alert: "Failed to update leave status: #{@leave.errors.full_messages.to_sentence}"
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
    params.require(:leave_request).permit(:form_date, :to_date, :reason, :leave_type, :request_id, :approval_id, :status, :transport)
  end
end
