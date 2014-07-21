Feature: Wiki page editing

  Background:
    Given I have signed in with valid credentials

  Scenario: Edit page body
    When I create a page entitled "Test" with content "Test me"
    And I change the page content to "Mario Testino"

    Then I can see a page entitled "Test" with content "Mario Testino"

  Scenario: Edits to a page content should be recorded in page history
    When I create a page entitled "Test" with content "Test me"
    And I change the page content to "Mario Testino"
    And I change the page content to "Famous Photographer"

    Then I can see one item of page history containing "Test me" as third most recent
    And I can see one item of page history containing "Mario Testino" as second most recent
    And I can see one item of page history containing "Famous Photographer" as most recent

  Scenario: Edits to a page title should be recorded in page history
    When I create a page entitled "Test" with content "Test me"
    And I change the page title to "Mario Testino's Page"

    Then I can see one item of page history containing "Mario Testino's Page" as most recent

  Scenario: Edit page title
    When I create a page entitled "Test" with content "Test me"
    And I change the page title to "Famous Photographer"

    Then I can see a page with title "Famous Photographer"

  Scenario: Edit page title to a pre-existing title
    When I create a page entitled "Pre-existing title" with content "Test me"
    And I create a page entitled "Test" with content "Test me"
    And I change the page title to "Pre-existing title"

    Then I can see a "has already been taken" error for the page title

  Scenario: I can comment on pages
    When I create a page entitled "Test" with content "Test me"
    And I make the comment "Test me" on the page entitled "Test"

    Then I can see a comment "Test me" as most recent comment on the page entitled "Test"

  Scenario: I can comment on pages, and they will appear with most recent first
    When I create a page entitled "Test" with content "Test me"
    And I make the comment "Test me" on the page entitled "Test"
    And I make the comment "Test me please" on the page entitled "Test"

    Then I can see a comment "Test me please" as most recent comment on the page entitled "Test"
    And I can see a comment "Test me" as second most recent comment on the page entitled "Test"