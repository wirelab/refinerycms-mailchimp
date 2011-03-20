require 'rake'

task :build do
  output = `gem build refinerycms-mailchimp.gemspec`
  if output =~ /File: refinerycms-mailchimp-([\d\.]+).gem/
    `gem install ./refinerycms-mailchimp-#{$1}.gem`
  end
end