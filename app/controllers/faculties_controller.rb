class FacultiesController < ApplicationController
	before_action :configure_permitted_parameters

  def configure_permitted_parameters
    flash[:notice] = params
    authenticate_user!
    @faculty = Faculty.where(user_id: current_user.id).last || Faculty.new    
  end 


	def new
		# Safety check, new faculty must only be created for users with category set to "faculty"
		if current_user.category != "faculty"
			redirect_to root_path and return 
		end

		# If current user's faculty record is nil
		if Faculty.where(user_id: current_user.id).last.nil?

			@faculty = Faculty.new(faculty_params)
			@faculty.user_id = current_user.id
			@faculty.save
			
			if @faculty.errors.any?
				flash[:notice] = @faculty.errors.full_messages
				render "faculties/_faculty_first_sign_in_form"
			else
				redirect_to root_path and return
			end
			
		# if current user's faculty record already exists
		else
			redirect_to root_path and return
		end
	end

	def faculty_params
		params.require(:faculty).permit(:name, :verified, :user_id)
	end
end
