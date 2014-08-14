Feature: Removing items from the collection

  Background:
    Given I have signed in
    When An admin has created a collection item

  Scenario:
    Given I am signed in as an admin
    When I visit the collection item
    When I delete the collection item

    Then I can't see the collection item

  Scenario: Standard users cannot delete collection items
    When I visit the collection item
    Then I can't see the delete collection item button