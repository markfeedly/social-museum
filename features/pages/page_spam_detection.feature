Feature: Spam detection and prevention on Wiki pages
  Background:
    Given I am signed in as a spammer

  Scenario: A spammer can't create a page
    When I create a page

    Then I can see an "This page has been marked as potential spam, please edit and try again, or cancel." error for the page content

  Scenario: A spammer can't edit a page
    Given someone else creates a page
    When I visit the page
    And I change the page content to "spam"

    Then I can see an "This page has been marked as potential spam, please edit and try again, or cancel." error for the page content
