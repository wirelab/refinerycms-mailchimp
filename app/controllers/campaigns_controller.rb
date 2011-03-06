class CampaignsController < ApplicationController

  before_filter :find_all_campaigns
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @campaign in the line below:
    present(@page)
  end

  def show
    @campaign = Campaign.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @campaign in the line below:
    present(@page)
  end

protected

  def find_all_campaigns
    @campaigns = Campaign.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/campaigns")
  end

end
