class Event < ActiveRecord::Base
  default_scope :order => 'sequence'
  has_many :trials, :dependent => :destroy
  
  #todo: add before_destroy
end
