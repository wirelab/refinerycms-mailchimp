

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-mailchimp'
  s.version           = '0.0.1'
  s.description       = 'Ruby on Rails Mailchimp engine for Refinery CMS'
  s.date              = '2011-03-06'
  s.summary           = 'Ruby on Rails Mailchimp engine for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*', 'spec/**/*', 'features/**/*', 'db/**/*']
end
