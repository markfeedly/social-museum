Feature: Tracking
  In order to keep up to date with page related information
  Interested users should receive emails about new pages and comments and page edits

  Background:
    Given I exist as a user
    And I confirm my email identity
    And I have signed in
    And I have created a page entitled "Test me"

  Scenario: Basic page and user test
    Then I am the only user and signed in
    And There is one page with title "Test me"

  Scenario: Page creator is subscribed and not emailed
    Then I am subscribed to page "Test me"
    And I an not emailed about page "Test me"

  Scenario: Page creator is notified when a user makes a comment
    When "Jane Doe" adds a comment "Meh" to the page entitled "Test me"
    Then I am emailed about a comment "Meh" by "Jane Doe" on page entitled "Test me"

  Scenario: Page creator is not notified when a spammer makes a comment
    When a spammer makes the comment "Spam!" on the page entitled "Test me"

    Then I am not emailed about the comment on "Test me"

  Scenario: Email has correct content
    When "Jane Doe" adds a comment "Meh" to the page entitled "Test me"
    Then I am emailed about a comment "Meh" by "Jane Doe" on page entitled "Test me"

  Scenario: Commenting on a page should subscribe a user to future comments
    When "Jane Doe" adds a comment "Meh" to the page entitled "Test me"
    When "Bob Hoskins" adds a comment "Mona Lisa" to the page entitled "Test me"
    Then I am emailed about a comment "Mona Lisa" by "Bob Hoskins" on page entitled "Test me"
    And "Jane Doe" is emailed about a comment "Mona Lisa" by "Bob Hoskins" on page entitled "Test me"

  Scenario: Only subscribers are notified about new comments
    Given "Jane Doe" is subscribed to the page "Test me"
    When I make a comment "Meh" on the page "Test me"
    Then "Jane Doe" is emailed about the comment "Meh" by myself on the page "Test me"
    And nobody else is emailed about the comment on "Test me"

  Scenario: Page creator is not notified of comments if unsubcribed
    Given "Jane Doe" adds a comment "Meh" to the page entitled "Test me"
    And I am emailed about a comment "Meh" by "Jane Doe" on page entitled "Test me"

    When I have unsubscribed from page entitled "Test me" via the emailed unsubscribe link
    But "Jane Doe" adds a comment "Meh" to the page entitled "Test me"
    Then I am not emailed about the comment on "Test me"

  Scenario: If a previously disapproved comment is approved, a notification is sent, but only once
    When a spammer makes the comment "Spam!" on the page entitled "Test me"
    And The comment on the page entitled "Test me" is approved
    And The comment on the page entitled "Test me" is disapproved
    And The comment on the page entitled "Test me" is approved
    Then I am only emailed about the comment on "Test me" once
