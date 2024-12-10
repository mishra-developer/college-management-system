class ProfilesController < ApplicationController
  def index
  end

  def show
    @student =User.find(params[:format])
  end
end
