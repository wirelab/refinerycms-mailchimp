Factory.define(:campaign) do |f|
  f.sequence(:subject) { |n| "See our #{n} newest site additions!" }
  f.body "Here's a campaign body!"
end