require 'hominid'
module Refinery
  module Mailchimp
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::Mailchimp

      engine_name :refinery_mailchimp

      initializer "register refinery_mailchimp plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "refinery-mailchimp"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.mailchimp_admin_campaigns_path }
          plugin.pathname = root
          plugin.menu_match = %r{refinery/mailchimp/campaigns(/.+?)?$}
          plugin.activity = {
            :class_name => :'refinery/mailchimp/campaign',
            :title => 'subject'
          }
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Mailchimp)
      end

    end

    class API < Hominid::API
      KeySetting = { :name => "mailchimp_api_key", :default => "Set me!" }
      DefaultFromNameSetting = { :name => "mailchimp_default_from_name", :default => "" }
      DefaultFromEmailSetting = { :name => "mailchimp_default_from_email", :default => "" }

      class BadAPIKeyError < StandardError; end

      def initialize
        api_key = ::Refinery::Mailchimp.api_key
        raise BadAPIKeyError if api_key.blank? || api_key == KeySetting[:default]

        begin
          super api_key
        rescue ArgumentError
          raise BadAPIKeyError
        end
      end
    end
  end
end
