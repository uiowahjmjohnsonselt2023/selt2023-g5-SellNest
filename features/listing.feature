Feature: Admin manages listings
  As an admin
  I want to create listings

  Scenario: Admin creates a new listing
    Given I am logged in as an admin
    When I go to the new listing page
    And I fill in the listing details
    And I submit the listing form
    Then I should see a confirmation that the listing was created
