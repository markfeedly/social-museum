Feature: Wiki page

  Background:
    Given I have signed in with valid credentials

  Scenario: See the header
    When I create a page entitled "Test" with content "My content"
    Then I see the navigation menu

  Scenario: Add a page and then see it
    When I create a page entitled "Test" with content "My content"
    Then I can see a page entitled "Test" with content "My content"

  Scenario: Add a tagged page and then see it
    When I create a tagged page entitled "Test" with content "Test me" and tags "a, bb"
    Then I can see a tagged page entitled "Test" with content "Test me" and tags "a, bb"





