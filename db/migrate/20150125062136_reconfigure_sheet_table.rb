class ReconfigureSheetTable < ActiveRecord::Migration
  def change
	rename_column :sheets, :name, :sheet_name
	rename_column :sheets, :classname, :sheet_creater  	
	rename_column :sheets, :rollno, :num_of_cols
	add_column :sheets, :num_of_rows, :integer
  end
end
