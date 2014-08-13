Feature: Wiki pages can be created

  Background:
    Given I have signed in with valid credentials

  Scenario: I add one page
    When I create a page

    Then I can see a page

  Scenario Outline: I add pages
    When I create <Number> pages

    Then I can see <Number> pages

  Examples:
    |Number|
    |0     |
    |1     |
    |2     |
    |9     |
    |10    |
    |11    |

  Scenario: Add a page with a title
    When I create a page entitled "Test"

    Then I can see a page entitled "Test"

  Scenario: Attempt to create a page with a duplicate title
    When I create a page entitled "Pre-existing title"
    Then I create a page entitled "Pre-existing title"

    Then I can see a "has already been taken" error for the page title

  Scenario: Add a page with content
    When I create a page with content "My content"

    Then I can see a page with content "My content"