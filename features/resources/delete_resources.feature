Feature: Resource page removal

  Background:
    Given I have signed in with valid credentials

  Scenario: Admins can remove resources
    When I am signed in as an admin
    And I create a new resource entitled "Test"
    And I delete a resource with title "Test"

    Then I cannot see a resource entitled "Test"

  Scenario: Standard users cannot remove pages
    When I create a new resource entitled "Test"

    Then I can't delete a resource with title "Test"
    And I can see a resource entitled "Test"