module Refinery
  module Mailchimp
    class SubscriptionsController < ::ApplicationController
      def create
        email = params[:email]
        list_id = ::Refinery::Setting.get_or_set("mailchimp_list_id", "Set me if you want sign-ups!")
        if client.list_subscribe(list_id, email, {}, 'html', false, true, true, true)
          @message =  t('refinery.mailchimp.subscriptions.success')
        else
          @message = t('refinery.mailchimp.subscriptions.unknown_error')
        end
        
      rescue Hominid::APIError => error
        if error.message.include? "Invalid Email Address"
          @message = t('refinery.mailchimp.subscriptions.invalid_email')
        else
          @message = t('refinery.mailchimp.subscriptions.unknown_error')
        end
      end

    protected

      def client
        @client ||= Refinery::Mailchimp::API.new
      end
    end
  end
end
