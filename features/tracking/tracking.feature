Feature: Tracking
  In order to keep up to date with page related information
  Interested users
  Should receive emails about new comments and major page edits

  Background:
    Given I exist as a user
    Given "Jane Doe" exists as a user
    Given "Bob Hoskins" exists as a user
    Given a clear email queue
    Given I create a page entitled "Test" with content "My content"

  Scenario: Page creator is notified when a comment is created
    When "Jane Doe" creates a comment "Meh" on page entitled "Test"
    Then I am emailed about a comment "Meh" on page entitled "Test"

  Scenario: Commenter is automatically subscribed to a page
    When "Jane Doe" creates a comment "Meh" on page entitled "Test"
    When "Bob Hoskins" creates a comment "Mona Lisa" on page entitled "Test"
    Then "Jane Doe" should receive an email
    When "Jane Doe" opens the email
    Then "Jane Doe" should see "New comment on Test" in the email subject
    And "Jane Doe" should see "Mona Lisa" in the email body
    When "Jane Doe" clicks the see page link in the email
    Then "Jane Doe" should see a page entitled "Test" with content "My content" and a comment "Mona Lisa"