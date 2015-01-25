class SheetsController < ApplicationController
	def new
		@sheet = Sheet.new
	end

	def create
		@sheet = Sheet.create(sheet_params)		
	end

	def sheet_params
	    params.require(:s_name).permit(:s_creator, :num_of_cols, :num_of_rows)		
	end

	def upload
		Sheet.import(params[:file])
		redirect_to root_url, notice: "Products imported."
	end
end
