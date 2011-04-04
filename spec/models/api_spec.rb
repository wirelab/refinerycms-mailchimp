require 'spec_helper'
require 'hominid'

Dir[File.expand_path('../../../features/support/factories/*.rb', __FILE__)].each{|factory| require factory}

describe Refinery::Mailchimp::API do
  describe "the client" do
    before do      
      RefinerySetting.find_by_name(Refinery::Mailchimp::API::KeySetting[:name]).try :destroy
      RefinerySetting.rewrite_cache
    end
    
    it "should give a properly setup client if the API key is set" do
      RefinerySetting.set Refinery::Mailchimp::API::KeySetting[:name], 'abcdefg-us1'
      Refinery::Mailchimp::API.new
    end
    
    it "should raise an error if the API key is not set" do
      begin
        client = Refinery::Mailchimp::API.new
        fail
      rescue Refinery::Mailchimp::API::BadAPIKeyError
      end
    end
    
    it "should raise an error if the API key is malformed" do
      begin
        RefinerySetting.set Refinery::Mailchimp::API::KeySetting[:name], 'abcdefg'
        client = Refinery::Mailchimp::API.new
        fail
      rescue Refinery::Mailchimp::API::BadAPIKeyError
      end
    end
  end
end