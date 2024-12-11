class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
    @student =User.find(params[:format])
  end
end
