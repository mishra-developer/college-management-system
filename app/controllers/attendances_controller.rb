class AttendancesController < ApplicationController
  before_action :set_lecture

  def index
    @attendances = @lacture.attendances
    @students = @lacture.class_room.students
  end

  def create
    date = Date.current # Ensure attendance is recorded for today's date

    @attendance = @lacture.attendances.find_or_initialize_by(student_id: params[:student_id], date: date)

    @attendance.update!(status: params[:status])

    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
    end
  end


  private

  def attendance_params
    params.permit(:lecture_id, :student_id, :status, :date)
  end

  def set_lecture
    @lacture = Lacture.find(params[:lacture_id])
  end
end
