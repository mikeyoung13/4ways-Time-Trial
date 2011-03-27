class Event < ActiveRecord::Base
  has_many :trials, :dependent => :destroy
  
  #todo: add before_destroy
end
