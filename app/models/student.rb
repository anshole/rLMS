class Student < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :rollno, :course, :branch, :class_name, :year, :semester
  belongs_to :user
end

