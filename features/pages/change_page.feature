Feature: Wiki page editing

  Background:
    Given I have signed in with valid credentials

  Scenario: Edit page body
    When I create a page entitled "Test" with content "Test me"
    And I change the content to "Mario Testino"

    Then I can see a page entitled "Test" with content "Mario Testino"

  Scenario: Edit page title
    When I create a page entitled "Test" with content "Test me"
    And I change the title to "Famous Photographer"

    Then I can see a page entitled "Famous Photographer" with content "Test me"

  Scenario: Edits to a page content should be recorded in page history
    When I create a page entitled "Test" with content "Test me"
    And I change the content to "Mario Testino"
    And I change the content to "Famous Photographer"

    Then I can see one item of page history containing "Test me" as third most recent
    And I can see one item of page history containing "Mario Testino" as second most recent
    And I can see one item of page history containing "Famous Photographer" as most recent

  Scenario: Edits to a page title should be recorded in page history
    When I create a page entitled "Test" with content "Test me"
    And I change the title to "Mario Testino's Page"

    Then I can see one item of page history containing "Mario Testino's Page" as most recent

  Scenario: Edit page title
    When I create a page entitled "Test" with content "Test me"
    And I change the title to "Famous Photographer"

    Then I can see a page with title "Famous Photographer"

  Scenario: Edit page title to a pre-existing title
    When I create a page entitled "Pre-existing title" with content "Test me"
    And I create a page entitled "Test" with content "Test me"
    And I change the title to "Pre-existing title"

    Then I can see a "has already been taken" error for the page title