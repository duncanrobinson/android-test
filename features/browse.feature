Feature: Shop Navigation
  Browse through the shop using the sliding tabs on the Shop page

  Background:
    Given a valid user account ready for use on a new device
    And I am signed in
    And I am on the My Library page
    When I touch the shop icon

  Scenario Outline: Navigating through the shop categories
    Given I touch the <tab> category
    Then I should be taken to the <tab> page
    And there is at least one book present

  Examples:
    | tab                 |
    | Fiction top 100     |
    | Non-fiction top 100 |
    | New releases        |

  Scenario Outline: Verify that you're taken to the correct Categories page and the books return the expected details
    Given I navigate to the "Categories" section
    When I choose to go to the <category> category
    Then The <category> page loads
    And there is at least one book present

  Examples:
    | category          |
    | Romance           |
    | Art & Photography |
    | Food & Drink      |
    | Travel & Holiday  |

  Scenario: Verify that all the books in the free ebooks section are FREE!
    Given I navigate to the "Free ebooks" section
    Then there is at least one book present
    And all the prices should be FREE

  Scenario Outline: Verify that there is at least one book present beneath each of the sections in the 'Featured' area
    Given I navigate to the "Featured" section
    Then I can verify that the <featured_section> section has at least one book

  Examples:
    | featured_section        |
    | Fiction top 100         |
    | Non-fiction top 100     |
    | Biographies of the Year |