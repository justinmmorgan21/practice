class StudentsController < ApplicationController
  def student_params
    {
      name: params[:name],
      dob: params[:dob],
      email: params[:email],
    }
    end
    
    def create
      @student = Student.new(student_params)
      if @student.save
        render :show
      else
        render json: {error: @student.errors.full_messages}, status: :unprocessable_entity
      end
    end
    
    def show
      @student = Student.find_by(id: params[:id])
      render :show
    end
    def index
      @students = Student.all
      render :index
    end
    
    def update
      @student = Student.find_by(id: params[:id])
      @student.name = params[:name] || @student.name
      @student.dob = params[:dob] || @student.dob
      @student.email = params[:email] || @student.email
      if @student.save
        render :show
      else
        render json: {error: @student.errors.full_messages}, status: :unprocessable_entity
      end
    end
    def destroy
      @student = Student.find_by(id: params[:id])
      @student.destroy
      render json: {message: "#{@student.name} deleted."}
    end
    
end
