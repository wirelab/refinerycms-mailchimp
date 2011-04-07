Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-mailchimp'
  s.author            = 'Ian Terrell'
  s.email             = 'ian.terrell@gmail.com'
  s.homepage          = 'https://github.com/ianterrell/refinerycms-mailchimp'
  s.version           = '0.0.2'
  s.description       = 'Ruby on Rails Mailchimp engine for Refinery CMS.  Manage your campaigns right from the admin!'
  s.date              = '2011-04-04'
  s.summary           = 'Ruby on Rails Mailchimp engine for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*', 'spec/**/*', 'features/**/*', 'db/**/*']
  s.add_dependency    'hominid', '~> 3.0'
end
