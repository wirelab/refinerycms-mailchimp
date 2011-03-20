module NavigationHelpers
  module Refinery
    module Mailchimp
      def path_to(page_name)
        case page_name
        when /the list of campaigns/
          admin_campaigns_path
        when /the new campaigns? form/
          new_admin_campaign_path
        else
          begin
            if page_name =~ /the campaign titled "?([^\"]*)"?/ and (page = Campaign.find_by_title($1)).present?
              self.url_for(page.url)
            else
              nil
            end
          rescue
            nil
          end
        end
      end
    end
  end
end
