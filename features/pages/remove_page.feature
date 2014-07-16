Feature: Wiki page

  Background:
    Given I have signed in with valid credentials

  Scenario: Admins can remove pages
    When I turn an existing user into an administrator
    And I create a page entitled "Test" with content "Test me"
    And I remove a page entitled "Test" with content "Test me"

    Then I can't see a page entitled "Test" with content "Test me"