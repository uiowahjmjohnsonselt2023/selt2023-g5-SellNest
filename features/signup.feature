Feature: User Signup

  Scenario: Signing up for a new account
    Given I am on the signup page
    When I fill in the signup form
    And I submit the form
    Then I should be registered and redirected to the user dashboard