class Profile < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :first_name
  validates_presence_of :age
  validates_presence_of :nationality
  # validates_presence_of :location
  # validates_presence_of :occupation
  # validates_presence_of :gender
  # validates_presence_of :marital_status
  
end