class RecreateSheetTable < ActiveRecord::Migration
	  def change
	  	drop_table :new_sheet_tables
	    create_table :sheets do |t|
	      t.string :sheet_name
	      t.string :sheet_creator
	      t.integer :num_of_cols
	      t.integer :num_of_rows

	      t.timestamps null: false
	    end
	  end
end
