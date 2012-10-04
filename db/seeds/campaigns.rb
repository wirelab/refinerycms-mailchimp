if defined?(::Refinery::User)
  ::Refinery::User.all.each do |user|
    if user.plugins.where(:name => 'refinerycms-mailchimp').blank?
      user.plugins.create(:name => 'refinerycms-mailchimp',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

RefinerySetting.create :name => Refinery::Mailchimp::API::KeySetting[:name],              :value => Refinery::Mailchimp::API::KeySetting[:default],              :restricted => true
RefinerySetting.create :name => Refinery::Mailchimp::API::DefaultFromNameSetting[:name],  :value => Refinery::Mailchimp::API::DefaultFromNameSetting[:default],  :restricted => true
RefinerySetting.create :name => Refinery::Mailchimp::API::DefaultFromEmailSetting[:name], :value => Refinery::Mailchimp::API::DefaultFromEmailSetting[:default], :restricted => true
RefinerySetting.create :name => Refinery::Mailchimp::API::DefaultToNameSetting[:name],    :value => Refinery::Mailchimp::API::DefaultToNameSetting[:default],    :restricted => true

