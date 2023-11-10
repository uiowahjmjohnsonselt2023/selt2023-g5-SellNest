Feature: Admin Dashboard

  Scenario: Admin views the dashboard
    Given I am on the admin dashboard page
    Then I should see the "Admin Dashboard" header'
    And I should see the total sales stat
    And I should see the total users stat
    And I should see the total sellers stat
    And I should see the total items listed stat