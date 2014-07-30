Feature: Wiki page comment administration
  For admins,
  Comments which are not automatically approved are seen as pending.
  Pending comments can be approved.
  Approved comments can be disapproved and given pending status.
  Pending comments can be deleted.

  Background:
    Given I have signed in with valid admin credentials
    And I create a page entitled "Test"

  Scenario: Admins can see approved comments, and disapprove them
    Given I make the comment "Test me" on the page entitled "Test"
    And I can't see a message "This comment is awaiting approval" on the page entitled "Test"

    When I disapprove a comment on the page entitled "Test"

    Then I can see a message "Test me" on the page entitled "Test"

  Scenario: Admins can permanently remove pending comments
    Given a spammer makes the comment "Spam!" on the page entitled "Test"

    When I remove a comment on the page entitled "Test"

    Then I can't see a comment "Spam!" on the page entitled "Test"

  Scenario: Admins can see unapproved comments, and approve them
    Given a spammer makes the comment "Spam!" on the page entitled "Test"

    When I approve a comment on the page entitled "Test"

    Then I can't see a comment "Spam!" on the page entitled "Test"