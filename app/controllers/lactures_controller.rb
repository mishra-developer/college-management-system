class LacturesController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.role =='Teacher'
      @teacher = Teacher.find(current_user.id)
      @lactures = @teacher.lactures
    elsif current_user.role == 'SuperAdmin'
      @lactures = Lacture.all
    end
  end
end