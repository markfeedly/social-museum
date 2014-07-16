Feature: Wiki page addition

  Background:
    Given I have signed in with valid credentials

  Scenario: Add a page and then see it
    When I create a page entitled "Test" with content "My content"

    Then I can see a page entitled "Test" with content "My content"

  Scenario: Add a pair of pages
    When I create a page entitled "Test1" with content "My content"
    And I create a page entitled "Test2" with content "My content"
    And I navigate to the 'Pages' page

    Then I can see a page entitled "Test1" with content "My content"
    And I can see a page entitled "Test2" with content "My content"

  Scenario: Add a tagged page and then see it
    When I create a tagged page entitled "Test" with content "Test me" and tags "a, bb"

    Then I can see a tagged page entitled "Test" with content "Test me" and tags "a, bb"