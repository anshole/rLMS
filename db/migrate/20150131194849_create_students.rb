class CreateStudents < ActiveRecord::Migration
  def change
    # This redundancy in the data (eg semester/year) is to make running queries easier.
    # for example this makes getting list of all students in x year or in y semester much easier. 
    # However, this is just for temporary mock up, and will need to be redone. Example: a student can
    # choose MBA course with EE branch which doesn't make sense.
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :rollno
      t.string :course
      t.string :branch
      t.string :class_name
      t.string :year
      t.string :semester

      t.timestamps null: false
    end
  end
end
