require 'refinery'
require 'hominid'

module Refinery
  module Mailchimp
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "campaigns"
          plugin.activity = {:class => Campaign,}
        end
      end
    end
    
    class API < Hominid::API
      KeySetting = { :name => "mailchimp_api_key", :default => "Set me!" }
      DefaultFromNameSetting = { :name => "mailchimp_default_from_name", :default => "" }
      DefaultFromEmailSetting = { :name => "mailchimp_default_from_email", :default => "" }
      DefaultToNameSetting = { :name => "mailchimp_default_to_name", :default => "" }
      
      class BadAPIKeyError < StandardError; end
      
      def initialize
        api_key = RefinerySetting.get_or_set KeySetting[:name], KeySetting[:default]
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
