require 'refinery'

module Refinery
  module Campaigns
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
  end
end
