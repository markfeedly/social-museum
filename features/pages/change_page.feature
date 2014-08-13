Feature: Wiki pages can be edited

  Background:
    Given I have signed in with valid credentials

  Scenario: Change title
    When I create a page
    And I change the page title to "Famous Photographer"

    Then I can see a page entitled "Famous Photographer"

  Scenario: Can't change title to one which already exists
    When I create a page entitled "Pre-existing title"
    And I create a page
    And I change the page title to "Pre-existing title"

    Then I can see a "has already been taken" error for the page title

  Scenario: Edit body
    When I create a page
    And I change the page content to "Mario Testino"

    Then I can see a page with content "Mario Testino"