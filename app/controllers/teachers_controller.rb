class TeachersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_teacher, only: %i[show edit update destroy]

  # GET /teachers
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/:id
  def show
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # POST /teachers
  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to @teacher, notice: 'Teacher was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /teachers/:id/edit
  def edit
  end

  # PATCH/PUT /teachers/:id
  def update
    if @teacher.update(teacher_params)
      redirect_to @teacher, notice: 'Teacher was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /teachers/:id
  def destroy
    @teacher.destroy
    redirect_to teachers_url, notice: 'Teacher was successfully deleted.'
  end

  private

  # Set the Teacher for actions requiring a specific record
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through
  def teacher_params
    params.require(:Teacher).permit(:name, :email, :phone_number, :address, :dob)
  end

end
