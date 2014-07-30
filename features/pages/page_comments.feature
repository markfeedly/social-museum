Feature: Commenting on wiki pages

  Background:
    Given I have signed in with valid credentials
    And I create a page entitled "Test"

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

  Scenario: I can see my own unapproved comments
    Given I have signed in as a spammer
    When I create a page entitled "Test"
    And I make the comment "Test me" on the page entitled "Test"

    Then I can see a comment "Test me" on the page entitled "Test"
    And I can see a message "This comment is awaiting approval" on the page entitled "Test"

  Scenario: I can only see others' approved comments
    When a spammer makes the comment "Spam!" on the page entitled "Test"
    And another user makes the comment "Ham!" on the page entitled "Test"

    Then I can see a comment "Ham!" on the page entitled "Test"
    And I cannot see a comment "Spam!" on the page entitled "Test"