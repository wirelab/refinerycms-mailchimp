module Refinery
  class MailchimpGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def generate_mailchimp_initializer
      template 'config/initializers/refinery/mailchimp.rb.erb', File.join(destination_root, 'config', 'initializers', 'refinery', 'mailchimp.rb')
    end

    def rake_db
      rake("refinery_mailchimp:install:migrations")
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by Refinery CMS Recipes extension
Refinery::Mailchimp::Engine.load_seed
        EOH
      end
    end
  end
end
