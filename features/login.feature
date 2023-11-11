Feature: User Login

  Scenario: Logging into the application
    Given I am on the login page
    When I enter valid credentials
    Then I should be redirected to the user dashboard