class Trial < ActiveRecord::Base
  GENDER_TYPES = [ "M", "F" ]
  validates :gender, :inclusion => GENDER_TYPES
  validates :bib, :event_id, :gender, :presence => true
  belongs_to :event
end
