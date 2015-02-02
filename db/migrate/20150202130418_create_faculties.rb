class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :name
      t.boolean :verified
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
