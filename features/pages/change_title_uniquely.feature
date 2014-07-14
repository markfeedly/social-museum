Feature: Wiki page

  Background:
    Given I have signed in with valid credentials

  Scenario: Edit page title
    When I create a page entitled "Test" with content "Test me"
    And I change the title to "Famous Photographer"
    Then I can see a page with title "Famous Photographer"

  Scenario: Edit page title
    When I create a page entitled "Pre-existing title" with content "Test me"
    When I create a page entitled "Test" with content "Test me"
    And I change the title to "Pre-existing title"
    Then I can see a "Title has already been taken" error message
