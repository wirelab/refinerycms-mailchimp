class Campaign < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :body]
  
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  


end
