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
    Given "Jane Doe" signs in and adds a comment "Meh" to the page entitled "Test me"
    Then I am emailed about a comment "Meh" on page entitled "Test me"

  Scenario: Email has correct content
    Given "Jane Doe" signs in and adds a comment "Meh" to the page entitled "Test me"
    Then I am emailed about a comment "Meh" on page entitled "Test me"
    And I should see /UMCS/ in the email subject
    And  I should see /New comment on page Test me/ in the email subject
    And  I should see /Jane Doe/ in the email body
    And  I should see /Test me/ in the email body
    And  I should see /Meh/ in the email body

  Scenario: Commenter is automatically subscribed to a page and notified after comment creations
    Given "Jane Doe" signs in and adds a comment "Meh" to the page entitled "Test me"
    Then I am emailed about a comment "Meh" on page entitled "Test me"
    And no one else is emailed

    When "Bob Hoskins" signs in and adds a comment "Mona Lisa" to the page entitled "Test me"
    Then I am emailed about a comment "Mona Lisa" on page entitled "Test me"
    Then "Jane Doe" is emailed about a comment "Mona Lisa" on page entitled "Test me"
    And no one else is emailed

    When "Testy McUserton" signs in and adds a comment "Acting" to the page entitled "Test me"
    Then "Jane Doe" is emailed about a comment "Acting" on page entitled "Test me"
    Then "Bob Hoskins" is emailed about a comment "Acting" on page entitled "Test me"
    And no one else is emailed

    When "Patti Smith" signs in and adds a comment "Horses" to the page entitled "Test me"
    Then I am emailed about a comment "Horses" on page entitled "Test me"
    Then "Jane Doe" is emailed about a comment "Horses" on page entitled "Test me"
    Then "Bob Hoskins" is emailed about a comment "Horses" on page entitled "Test me"
    And no one else is emailed

  Scenario: Page creator is notified when a comment is created
    Given "Jane Doe" signs in and adds a comment "Meh" to the page entitled "Test me"
    Then I am emailed about a comment "Meh" on page entitled "Test me"
    Given I unsubscribe from page entitled "Test me" via the emailed unsubscribe link
    Given "Jane Doe" signs in and adds a comment "Hem" to the page entitled "Test me"
    And I am not emailed

