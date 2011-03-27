class Trial < ActiveRecord::Base
  GENDER_TYPES = [ "M", "F" ]
  validates :gender, :inclusion => GENDER_TYPES
  belongs_to :event
end
