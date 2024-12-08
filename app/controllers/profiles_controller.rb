class ProfilesController < ApplicationController
  def index
  end

  def show
    @student =Student.find(params[:format])

  end
end
