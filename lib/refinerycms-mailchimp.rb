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
      KeySetting = { :name => "Mailchimp API Key", :default => "Set me!" }
      class NoAPIKeyError < StandardError; end
      class BadAPIKeyError < StandardError; end
      
      def initialize
        api_key = RefinerySetting.find_or_set KeySetting[:name], KeySetting[:default]
        raise NoAPIKeyError if api_key == KeySetting[:default]
        
        begin
          super api_key
        rescue ArgumentError
          raise BadAPIKeyError
        end
      end
    end
  end
end
