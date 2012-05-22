module Refinery
  module Mailchimp
    class SubscriptionsController < ::ApplicationController
      def create
        email = params[:email]
        list_id = ::Refinery::Setting.get_or_set("mailchimp_list_id", "Set me if you want sign-ups!")
        if client.list_subscribe(list_id, email, {}, 'html', false, true, true, true)
          @message =  "Succes" #t('admin.campaigns.campaign.subscribe_success', :email => email)
        else
          @message = "Failure" #t('admin.campaigns.campaign.subscribe_failure', :email => email)
        end
      rescue Hominid::APIError
        @message = "Failure"
      end

    protected

      def client
        @client ||= Refinery::Mailchimp::API.new
      end
    end
  end
end
