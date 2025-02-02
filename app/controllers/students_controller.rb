class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: %i[show edit update destroy]

  # GET /students
  def index
    @students = Student.all
  end

  # GET /students/:id
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # POST /students
  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = 'Student was successfully created.'
      redirect_to profiles_show_path(@student)
    else
      render :welcome_index_path, status: :unprocessable_entity
    end
  end

  # GET /students/:id/edit
  def edit
  end

  # PATCH/PUT /students/:id
  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Student was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /students/:id
  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Student was successfully deleted.'
  end

  private

  # Set the student for actions requiring a specific record
  def set_student
    @student = Student.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :phone_number, :address, :date_of_birth, :roll_no, :password, :password_confirmation)
  end
end
