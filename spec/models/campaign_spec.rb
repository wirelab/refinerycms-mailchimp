require 'spec_helper'
Dir[File.expand_path('../../../features/support/factories/*.rb', __FILE__)].each{|factory| require factory}

describe Campaign do
  describe "validations" do
    it "should be valid with valid attributes" do
      Factory.build(:campaign).should be_valid
    end

    it "requires subject" do
      Factory.build(:campaign, :subject => "").should_not be_valid
    end
    
    it "requires a body" do
      Factory.build(:campaign, :body => "").should_not be_valid
    end
  end
  
  describe "integrating with Mailchimp" do
    it "should save to mailchimp before create" do
      campaign = Factory.build(:campaign)
      campaign.mailchimp_campaign_id.should be_nil

      Refinery::Mailchimp::API.should_receive(:new).and_return(mock('api', :create_campaign => 'abcdef'))
      campaign.save
      campaign.reload.mailchimp_campaign_id.should == 'abcdef'
    end
    
    it "should not create and add error if mailchimp create fails"
    it "should update mailchimp before save"
    it "should not save if mailchimp update fails"
    it "should know if it's been sent or scheduled"
    it "should know where it was sent to"
  end
end