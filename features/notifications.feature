Feature: Notifications Management

  Scenario: User views notifications
    Given I am logged in as a user
    And I have unread notifications
    When I visit the notifications page
    Then I should see a list of my notifications

  Scenario: User marks a notification as read
    Given I am logged in as a user
    And I have unread notifications
    When I click on a notification's "Mark as read" link
    Then that notification should be marked as read
