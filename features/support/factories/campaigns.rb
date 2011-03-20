Factory.define(:campaign) do |f|
  f.sequence(:title) { |n| "See our #{n} newest site additions!" }
end