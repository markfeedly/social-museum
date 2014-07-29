Feature: Wiki page comment administration
  For admins,
  Comments which are not automatically approved are seen as pending.
  Pending comments can be approved.
  Approved comments can be disapproved and given pending status.
  Pending comments can be deleted.

  Background:
    Given I have signed in with valid admin credentials
    And a user has posted a comment

  Scenario: Admins can see approved comments, and disapprove them
    Given the comment was approved

    When I disapprove the comment

    Then I can see the comment is now pending

  Scenario: Admins can permanently remove pending comments
    Given the comment was not approved

    When I remove the comment

    Then I can no longer see the comment

  Scenario: Admins can see unapproved comments, and approve them
    Given the comment was not approved

    When I approve the comment

    Then I can see the comment is approved