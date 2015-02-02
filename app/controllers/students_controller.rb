class StudentsController < ApplicationController

  before_action :configure_permitted_parameters

  def configure_permitted_parameters
    flash[:notice] = params
    authenticate_user!
    @student = Student.where(user_id: current_user.id).last || Student.new    
  end 

	def new
		# If current user's student record is nil
		if Student.where(user_id: current_user.id).last.nil?
			@student = Student.new(student_params)
			@student.user_id = current_user.id
			@student.save
			
			if @student.errors.any?
				flash[:notice] = @student.errors.full_messages
				render "students/partials/_first_sign_in_form"
			else
				redirect_to root_path
			end
		# if current user's student record already exists
		else
			redirect_to root_path
		end
	end

	def student_params
		params.require(:student).permit(:first_name, :last_name, :rollno, :course, :branch, :class_name, :year, :semester)
	end
end
