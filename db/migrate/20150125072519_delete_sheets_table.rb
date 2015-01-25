class DeleteSheetsTable < ActiveRecord::Migration
  def change
  	drop_table :sheets
  end
end
