class Campaign < ActiveRecord::Base

  acts_as_indexed :fields => [:subject, :body]
  
  validates_presence_of :subject, :body

end
