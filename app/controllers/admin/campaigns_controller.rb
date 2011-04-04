class Admin::CampaignsController < Admin::BaseController
  rescue_from Refinery::Mailchimp::API::BadAPIKeyError, :with => :need_api_key
  rescue_from Hominid::APIError, :with => :need_api_key
  
  before_filter :get_mailchimp_assets, :except => :index
  
  crudify :campaign, :order => "updated_at desc", :sortable => false, :title_attribute => :subject
  
  def new
    @campaign = Campaign.new :to_name => RefinerySetting.get_or_set(Refinery::Mailchimp::API::DefaultToNameSetting[:name], Refinery::Mailchimp::API::DefaultToNameSetting[:default]),
                             :from_name => RefinerySetting.get_or_set(Refinery::Mailchimp::API::DefaultFromNameSetting[:name], Refinery::Mailchimp::API::DefaultFromNameSetting[:default]),
                             :from_email => RefinerySetting.get_or_set(Refinery::Mailchimp::API::DefaultFromEmailSetting[:name], Refinery::Mailchimp::API::DefaultFromEmailSetting[:default])
  end

protected
  def need_api_key
    msg = t('admin.campaigns.index.set_api_key')
    msg += " <a href=\"#{edit_admin_refinery_setting_path(RefinerySetting.find_by_name(Refinery::Mailchimp::API::KeySetting[:name]))}\" style=\"display:inline\">#{t('admin.campaigns.index.set_api_link')}</a>"
    flash[:alert] = msg.html_safe
    redirect_to admin_campaigns_path
  end
  
  def get_mailchimp_assets
    @lists = Refinery::Mailchimp::API.new.lists['data']
    @templates = Refinery::Mailchimp::API.new.templates['user']
  end
end
