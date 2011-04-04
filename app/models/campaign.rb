class Campaign < ActiveRecord::Base

  acts_as_indexed :fields => [:subject, :body]
  
  validates_presence_of :subject, :body, :mailchimp_list_id, :from_email, :from_name, :to_name
  
  before_save :save_to_mailchimp
  
protected

  def save_to_mailchimp
    # google_analytics = RefinerySetting.find_or_set Refinery::Mailchimp::API::GoogleAnalyticsSetting[:name], Refinery::Mailchimp::API::GoogleAnalyticsSetting[:default]
    
    options = { :subject => subject, :from_email => from_email, :from_name => from_name, :to_name => to_name, :list_id => mailchimp_list_id, :generate_text => true } #:auto_tweet => auto_tweet
    options[:template_id] = mailchimp_template_id unless mailchimp_template_id.blank?
    # options[:analytics] = { :google => google_analytics } unless google_analytics.blank?
    
    self.mailchimp_campaign_id = Refinery::Mailchimp::API.new.campaign_create 'regular', options, { :html => body }

    if self.mailchimp_campaign_id.blank?
      self.errors.add :base, "Could not save to Mailchimp! Please make sure your API key is right and that you are using a good 'From' email address."
      return false
    end
  end

end
