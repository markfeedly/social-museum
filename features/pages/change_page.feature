Feature: Wiki page editing

  Background:
    Given I have signed in with valid credentials

  Scenario: Edit page title
    When I create a page
    And I change the page title to "Famous Photographer"

    Then I can see a page entitled "Famous Photographer"

  Scenario: Edit page title to a pre-existing title
    When I create a page entitled "Pre-existing title"
    And I create a page
    And I change the page title to "Pre-existing title"

    Then I can see a "has already been taken" error for the page title

  Scenario: Edit page body
    When I create a page with content "Test me"
    And I change the page content to "Mario Testino"

    Then I can see a page with content "Mario Testino"

  Scenario: Edits to a page title should be recorded in page history
    When I create a page with content "My Page"
    And I change the page title to "Mario Testino's Page"
    And I change the page title to "Mario Testino's Favourite Page"

    Then I can see one item of page history containing "Mario Testino's Favourite Page" as most recent
    And I can see one item of page history containing "Mario Testino's Page" as second most recent
    And I can see one item of page history containing "My Page" as third most recent

  Scenario: Edits to a page content should be recorded in page history
    When I create a page with content "Test me"
    And I change the page content to "Mario Testino"
    And I change the page content to "Famous Photographer"

    Then I can see one item of page history containing "Test me" as third most recent
    And I can see one item of page history containing "Mario Testino" as second most recent
    And I can see one item of page history containing "Famous Photographer" as most recent

  Scenario: I can comment on pages
    When I create a page entitled "Test"
    And I make the comment "Test me" on the page entitled "Test"

    Then I can see a comment "Test me" as most recent comment on the page entitled "Test"

  Scenario: I can comment on pages, and they will appear with in recent-first order
    When I create a page entitled "Test"
    And I make the comment "Test me" on the page entitled "Test"
    And I make the comment "Test me please" on the page entitled "Test"

    Then I can see a comment "Test me please" as most recent comment on the page entitled "Test"
    And I can see a comment "Test me" as second most recent comment on the page entitled "Test"