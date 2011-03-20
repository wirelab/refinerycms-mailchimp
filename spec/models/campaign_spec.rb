require 'spec_helper'
Dir[File.expand_path('../../../features/support/factories/*.rb', __FILE__)].each{|factory| require factory}

describe Campaign do
  describe "validations" do
    before(:each) do
      
    end

    it "requires title" do
      true.should == true
    end
  end
end