class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
    @user =User.find(params[:format])
  end

  def update
    @user =User.find(params[:format])
  end
end
