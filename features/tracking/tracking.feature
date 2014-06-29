Feature: Tracking
  In order to keep up to date with page related information
  Interested users
  Should receive emails about new comments and major page edits

  Background:
    Given I exist as a user
    When I sign in with valid credentials
    And I create a page entitled "Test me" with content "My content"
    And I sign out

  Scenario: Page creator is notified when a comment is created
    Then I am on the subscriber list for "Test me"
    Given "Jane Doe" signs in and adds a comment "Meh" to the page entitled "Test me"
    Then I am emailed about a comment "Meh" on page entitled "Test me"

  Scenario: Email has correct content
    When "Jane Doe" creates a comment "Meh" on page entitled "Test me"
    Then I should see the system name in the email subject
    And  I should see "New comment on page Test me" in the email subject
    And  I should see "Jane Doe" as the commenter in the email body
    And  I should see "Test me" as the title in the email body
    And  I should see "Meh" as the comment in the email body

  Scenario: Commenter is automatically subscribed to a page and notified after comment creations
    Given "Jane Doe" signs in and adds a comment "Meh" to the page entitled "Test me"
    When "Bob Hoskins" signs in and adds a comment "Mona Lisa" to the page entitled "Test me"
    Then "Jane Doe" is emailed about a comment "Meh" on page entitled "Test me"
    Then I am emailed about a comment "Meh" on page entitled "Test me"
    Then I am emailed about a comment "Mona Lisa" on page entitled "Test me"
    Then "Jane Doe" emailed about a comment "Mona Lisa" on page entitled "Test me"