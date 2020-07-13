class StudentsController < ApplicationController

  def index
    @students = Student.all
  end
  
  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
    @instructors = Instructor.all
  end

  def create
    @student = Student.new(student_params)
    if @student.valid?
      @student.save
      redirect_to @student.instructor
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to "/students/new"
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :major, :age, :instructor_id)
  end



end
