class Sheet < ActiveRecord::Base
	require 'csv'

	def self.import(file)
		allowed_attributes = [ "sheet_name", "sheet_creator", "num_of_cols", "num_of_rows" ]
		
		spreadsheet = open_spreadsheet(file)
		#header = spreadsheet.row(1)
		(1..spreadsheet.last_row).each do |i|
			row = Hash[[spreadsheet.row(i)].transpose]
			#Sheet.create! (row.to_hash.select { |k,v| allowed_attributes.include? k }) 
			sheet = find_by_id(row["id"]) || new
      		#sheet.attributes = row.to_hash.slice(*allowed_attributes)
      		sheet.sheet_name = spreadsheet.cell(2,1)
      		sheet.sheet_creator = spreadsheet.cell(2,1)
      		sheet.num_of_cols = spreadsheet.last_column
      		sheet.num_of_rows = spreadsheet.last_row
      		sheet.save!
		end
	end
	
	def self.open_spreadsheet(file)
		case File.extname(file.original_filename)
			when ".csv" then Roo::Csv.new(file.path, nil)
			when ".xls" then Roo::Excel.new(file.path, nil)
			when ".xlsx" then Roo::Excelx.new(file.path, nil)
			else raise "Unknown file type: #{file.original_filename}"
		end			
	end
end
