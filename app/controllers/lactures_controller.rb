class LacturesController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.role =='Teacher'
      @teacher = Teacher.find(current_user.id)
      @lactures = @teacher.lactures
    elsif current_user.role == 'SuperAdmin'
      @lactures = Lacture.all
    elsif current_user.role == 'Student'
      @attendances = current_user.attendances.where(date: 1.month.ago.to_date..Date.today)
    elsif current_user.role == 'Parent'
      @attendances = current_user.students.first.attendances.where(date: 1.month.ago.to_date..Date.today)
    end
  end
end