class RenameSheetColumns < ActiveRecord::Migration
  def change
  	rename_column :sheets, :sheet_name, :s_name
	rename_column :sheets, :sheet_creater, :s_creator  	
  end
end
