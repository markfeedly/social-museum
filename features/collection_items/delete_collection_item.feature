Feature: Removing items from the collection

  Background:
    Given An admin has created a collection item called "Tube"

  Scenario:
    Given I am signed in as an admin
    When I delete the collection item called "Tube"
    Then I can't see the collection item called "Tube"

  Scenario: Standard users cannot delete collection items
    Given I am signed in
    Then I can't delete the collection item "Tube"