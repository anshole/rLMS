class FixColumnName < ActiveRecord::Migration
  def change
  	 rename_column :sheets, :class, :classname
  end
end
