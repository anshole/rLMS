class AddAmountToSheets < ActiveRecord::Migration
  def change
  	add_column :sheets, :class, :string
  	add_column :sheets, :rollno, :integer
  end
end
