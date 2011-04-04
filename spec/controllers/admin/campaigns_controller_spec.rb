require 'spec_helper'
Dir[File.expand_path('../../../../features/support/factories/*.rb', __FILE__)].each{|factory| require factory}

describe Admin::CampaignsController do
  describe "getting lists and templates" do
    should "get lists and templates on new"
    should "get lists and templates on create"
  end
  
  describe "creating a campaign" do
    should "redirect to index with flash message if API is not set up"
  end
  
  describe "sending the campaign" do
    it "should send a test email"
    it "should send the campaign now"
    it "should schedule the campaign to send in the future"
  end
end