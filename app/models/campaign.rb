class Campaign < ActiveRecord::Base

  acts_as_indexed :fields => [:subject, :body]
  
  validates_presence_of :subject, :body, :mailchimp_list_id, :from_email, :from_name, :to_name
  
  before_save :update_mailchimp_campaign
  before_create :create_mailchimp_campaign
  
  def google_analytics
    RefinerySetting.find_or_set Refinery::Mailchimp::API::GoogleAnalyticsSetting[:name], Refinery::Mailchimp::API::GoogleAnalyticsSetting[:default]
  end
protected

  def create_mailchimp_campaign
    options = { :subject => subject, :from_email => from_email, :from_name => from_name, :to_name => to_name, :list_id => mailchimp_list_id, :generate_text => true } #:auto_tweet => auto_tweet
    options[:template_id] = mailchimp_template_id unless mailchimp_template_id.blank?
    # options[:analytics] = { :google => google_analytics } unless google_analytics.blank?
    
    self.mailchimp_campaign_id = begin
      Refinery::Mailchimp::API.new.campaign_create 'regular', options, { :html => body }
    rescue Hominid::APIError
      nil
    end

    return halt_with_mailchimp_error if self.mailchimp_campaign_id.blank?
  end
  
  def update_mailchimp_campaign
    return if new_record?
    
    client = Refinery::Mailchimp::API.new
    
    options = {:title => :subject, :from_email => :from_email, :from_name => :from_name, :to_name => :to_name, :list_id => :mailchimp_list_id, :template_id => :mailchimp_template_id, :content => :body}
    options.each_pair do |option_name, attribute|
      if changed.include?(attribute.to_s)
        success = client.campaign_update mailchimp_campaign_id, option_name, (option_name == :content ? { :html => body } : self.send(attribute))
        return halt_with_mailchimp_error unless success
      end
    end
  end

  def halt_with_mailchimp_error
    self.errors.add :base, I18n.t('admin.campaigns.campaign.mailchimp_error')
    return false
  end
end
