# Mailchimp engine for Refinery CMS

## How to use this engine with a Refinery CMS project

If you have a Refinery app set up already, add this engine to your Gemfile in the "USER DEFINED" area:

    gem 'refinerycms-mailchimp'
    
`bundle install` and you should be good to go.

If you're starting from scratch, you'll want to install Refinery and create a new app:

    gem install refinerycms
    refinerycms new_project
    cd new_project
    
Then add the gem as described above.

## How to run the test suite

Uncomment the following line in your Gemfile:

    gem 'refinerycms-testing',    '~> 0.9.9.9'
    
Then install the testing functionality with
    
    rails generate refinerycms_testing
    
You can now run all engine specs and Cucumber features with 'rake', or run them separately with 'rake spec' and 'rake cucumber'.