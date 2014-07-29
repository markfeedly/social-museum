Feature: Commenting on wiki pages

  Background:
    Given I have signed in with valid credentials
    And I create a page entitled "Test"

  Scenario: I can comment on pages
    When I comment

    Then I can see the comment as the most recent

  Scenario: I can comment on pages, and they will appear in recent-first order
    When I comment "Test me"
    And I comment "Test me please"

    Then I can see "Test me please" as the most recent comment
    And I can see "Test me" as second most recent comment

  Scenario: I can see my own unapproved comments
    When I comment
    And It is not approved

    Then I can see the comment
    And I can see a message "This comment is awaiting approval"

  Scenario: I can only see others' approved comments
    When Another user comments
    But It is not approved
    And another user comments

    Then I can see one comment