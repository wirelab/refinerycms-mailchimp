module Refinery
  module Mailchimp
    include ActiveSupport::Configurable

    config_accessor :api_key

    self.api_key = "Set me!"
  end
end

