class HomeController < ApplicationController

	def welcome
		@sheets = Sheet.order(:sheet_name)
	end

	# def upload
	# 	Sheet.import(params[:file])
	# end

end