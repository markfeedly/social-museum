Feature: Tracking
  In order to keep up to date with page related information
  Interested users
  Should receive emails about new comments and major page edits

  Background:
    Given I exist as a user
    And I have signed in
    And I have created a page entitled "Test me"

  Scenario: Page creator is notified when a user makes a comment
    When "Jane Doe" adds a comment "Meh" to the page entitled "Test me"
    Then I am emailed about a comment "Meh" on page entitled "Test me"

  Scenario: Page creator is not notified when a spammer makes a comment
    When a spammer makes the comment "Spam!" on the page entitled "Test me"

    Then I am not emailed

  Scenario: Email has correct content
    When "Jane Doe" adds a comment "Meh" to the page entitled "Test me"
    Then I am emailed about a comment "Meh" on page entitled "Test me"
    And I should see UMCS in the email subject
    And I should see New comment on page Test me in the email subject
    And I should see Jane Doe in the email body
    And I should see Test me in the email body
    And I should see Meh in the email body

  Scenario: Commenting on a page should subscribe a user to future comments
    When "Jane Doe" adds a comment "Meh" to the page entitled "Test me"
    Then I am emailed about a comment "Meh" on page entitled "Test me"
    But nobody else is emailed

    When "Bob Hoskins" adds a comment "Mona Lisa" to the page entitled "Test me"
    Then I am emailed about a comment "Mona Lisa" on page entitled "Test me"
    And "Jane Doe" is emailed about a comment "Mona Lisa" on page entitled "Test me"
    But nobody else is emailed

    When "Testy McUserton" adds a comment "Acting" to the page entitled "Test me"
    Then "Jane Doe" is emailed about a comment "Acting" on page entitled "Test me"
    And "Bob Hoskins" is emailed about a comment "Acting" on page entitled "Test me"
    But nobody else is emailed

    When "Patti Smith" adds a comment "Horses" to the page entitled "Test me"
    Then I am emailed about a comment "Horses" on page entitled "Test me"
    And "Jane Doe" is emailed about a comment "Horses" on page entitled "Test me"
    And "Bob Hoskins" is emailed about a comment "Horses" on page entitled "Test me"
    But nobody else is emailed

  Scenario: Page creator is not notified of comments if unsubcribed
    Given "Jane Doe" adds a comment "Meh" to the page entitled "Test me"
    And I am emailed about a comment "Meh" on page entitled "Test me"

    When I have unsubscribed from page entitled "Test me" via the emailed unsubscribe link
    But "Jane Doe" adds a comment "Meh" to the page entitled "Test me"
    Then I am not emailed

