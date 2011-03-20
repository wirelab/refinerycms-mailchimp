require 'spec_helper'
Dir[File.expand_path('../../../features/support/factories/*.rb', __FILE__)].each{|factory| require factory}

describe Campaign do
  describe "validations" do
    it "should be valid with valid attributes" do
      Factory.build(:campaign).should be_valid
    end

    it "requires title" do
      Factory.build(:campaign, :title => "").should_not be_valid
    end
    
    it "requires a unique title" do
      campaign = Factory.create(:campaign)
      Factory.build(:campaign, :title => campaign.title).should_not be_valid
    end
    
    it "requires a body" do
      Factory.build(:campaign, :body => "").should_not be_valid
    end
  end
end