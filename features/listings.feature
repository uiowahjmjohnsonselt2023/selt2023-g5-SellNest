Feature: Listings Page

  Background: listings have been added to the database

    Given the following users exist:
      | email             | encrypted_password | full_name    | seller |
      | user1@example.com | password_digest    | John Doe     | true   |
      | user2@example.com | password_digest    | Jane Smith   | false  |
      | user3@example.com | password_digest    | Alice Johnson| true   |

    Given the following listings exist:
      | name           | description                               | price | user_id | photos | is_sold |
      | Cool Desk Lamp | Stylish lamp for your workspace           | 29.99 | 1       | []     | false   |
      | Vintage Chair  | Antique wooden chair, excellent condition | 79.99 | 3       | []     | false   |
      | Smartwatch     | Fitness tracker with heart rate monitoring| 169.99| 1       | []     | false   |


    Given the following tags exist:
      | name                  |
      | Art & Crafts          |
      | Beauty & Personal Care|
      | Books                 |
      | Clothing              |
      | Electronics           |
      | Furniture             |
      | Health & Fitness      |
      | Home & Kitchen        |
      | Sports & Outdoors     |
      | Toys & Games          |

    When I assign the following tags to the listings:
      | name              | tags                      |
      | Cool Desk Lamp    | Art & Crafts, Electronics |
      | Vintage Chair     | Furniture                 |
      | Smartwatch        | Electronics               |

  Scenario: Viewing all listings
    Given I am on the listings page
    Then I should see a list of available listings

  Scenario: Filtering listings by price range
    Given I am on the home page
    When I set the minimum price to "100"
    And I set the maximum price to "500"
    Then I should see filtered listings within the specified price range

  Scenario: Filtering listings by tag
    Given I am on the home page
    When I select the tag "Electronics" from the filter dropdown
    And I apply the tag filter
    Then I should see listings tagged as "Electronics"

  Scenario: Sorting listings by price (low to high)
    Given I am on the home page
    When I click on "Price Low to High"
    Then I should see listings sorted by price from low to high

  Scenario: Sorting listings by price (high to low)
    Given I am on the home page
    When I click on "Price High to Low"
    Then I should see listings sorted by price from high to low

  Scenario: Sorting listings by newest first
    Given I am on the home page
    When I click on "Newest First"
    Then I should see listings sorted by newest first

  Scenario: Sorting listings by oldest first
    Given I am on the home page
    When I click on "Oldest First"
    Then I should see listings sorted by oldest first
