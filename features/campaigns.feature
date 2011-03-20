@campaign
Feature: Campaigns
  Campaigns can be created through the given user model
  current_user is assumed through admin screens
  
  Scenario: Saving a campaign is successful
    Given I am a logged in refinery user
    
    When I am on the new blog post form
    And I fill in "Title" with "This is my blog post"
    And I fill in "Body" with "And I love it"
    And I press "Save"
    
    Then there should be 1 blog post
    And the blog post should belong to me