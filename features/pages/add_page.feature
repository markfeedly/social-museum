Feature: Wiki page addition

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
    |1     |
    |2     |
    |3     |
    |9     |
    |10    |
    |11    |
    |20    |
    |21    |

  Scenario: Add a page with a title
    When I create a page entitled "Test"

    Then I can see a page entitled "Test"

  Scenario: Add a page with  content
    When I create a page with content "My content"

    Then I can see a page with content "My content"

  Scenario: Add a tagged page and then see it
    When I create a page with tags "a, bb"

    Then I can see a page with tags "a, bb"