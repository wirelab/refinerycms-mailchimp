# Mailchimp engine for Refinery CMS

## How to use this engine with a Refinery CMS project

To set up a Refinery app from scratch, you'll need to install Refinery and create a new app:

    gem install refinerycms
    refinerycms new_project
    cd new_project

Once you have a Refinery app created, add this engine to your Gemfile in the `USER DEFINED` area:

    gem 'refinerycms-mailchimp'
    
Then, from the command line:

    bundle install
    rails generate refinerycms_mailchimp
    rake db:migrate

## How to run the test suite

Uncomment the following line in your Gemfile:

    gem 'refinerycms-testing',    '~> 0.9.9.9'
    
Then install the testing functionality with
    
    rails generate refinerycms_testing
    
You can now run all engine specs and features with `rake`, or run them separately with `rake spec` and `rake cucumber`.