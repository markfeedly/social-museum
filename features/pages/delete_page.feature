Feature: Wiki page removal

  Background:
    Given I have signed in with valid credentials
    And I create a page entitled "Test"

  Scenario: Admins can remove pages
    Given I am signed in as an admin
    When I delete the page entitled "Test"

    Then I can't see a page entitled "Test"

  Scenario: Standard users cannot remove pages
    When I create a page entitled "Test"

    Then I can't see the delete page button