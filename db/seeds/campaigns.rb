User.find(:all).each do |user|
  user.plugins.create(:name => "campaigns",
                      :position => (user.plugins.maximum(:position) || -1) +1)
end

RefinerySetting.create :name => Refinery::Mailchimp::API::KeySetting[:name],              :value => Refinery::Mailchimp::API::KeySetting[:default],              :restricted => true
RefinerySetting.create :name => Refinery::Mailchimp::API::DefaultFromNameSetting[:name],  :value => Refinery::Mailchimp::API::DefaultFromNameSetting[:default],  :restricted => true
RefinerySetting.create :name => Refinery::Mailchimp::API::DefaultFromEmailSetting[:name], :value => Refinery::Mailchimp::API::DefaultFromEmailSetting[:default], :restricted => true
RefinerySetting.create :name => Refinery::Mailchimp::API::DefaultToNameSetting[:name],    :value => Refinery::Mailchimp::API::DefaultToNameSetting[:default],    :restricted => true

