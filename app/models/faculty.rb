class Faculty < ActiveRecord::Base
	before_save :default_values
	validates_presence_of :name
	belongs_to :user

  def default_values
    self.verified ||=  'false'
  end
end
