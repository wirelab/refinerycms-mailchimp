FactoryGirl.define do
  factory :campaign, :class => Refinery::Mailchimp::Campaign do |f|
    f.sequence(:subject) { |n| "See our #{n} newest site additions!" }
    f.body "Here's a campaign body!"
    f.to_name "Jimmy"
    f.from_name "Johnny"
    f.from_email "Johnson"
    f.mailchimp_list_id "ah23jxj"
  end
end
