Feature: User Profile

  Scenario: Viewing the user profile
    Given I am on the user profile page
    Then I should see the user's photo
    And I should see the username
    And I should see the user profile information
    And I should see tabs for Listings and Settings