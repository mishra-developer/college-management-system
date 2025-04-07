class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
    @user =User.find(params[:format])
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(profile_params)
      redirect_to profiles_show_path(@user), notice: "Profile updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :address, :avatar)
  end
end
