Feature: Adding items to the collection

  Background:
    Given I have signed in as an admin

  Scenario: I add an item to the collection
    When I create a collection item

    Then I can see a collection item

  Scenario Outline: I add collection items
    When I create <Number> collection items

    Then I can see <Number> collection items

  Examples:
    |Number|
    |0     |
    |1     |
    |2     |
    |9     |
    |10    |
    |11    |

  Scenario: Add a collection item with a name
    When I create a collection item called "Test"

    Then I can see a collection item called "Test"

  Scenario: Attempt to create a collection item with a duplicate name
    When I create a collection item called "Pre-existing name"
    Then I create a collection item called "Pre-existing name"

    Then I can see a "has already been taken" error for the collection item name

  Scenario: Add a collection item with a description
    When I create a collection item with description "Vacuum tube"

    Then I can see a collection item with description "Vacuum tube"

  Scenario: Add a collection item with a location
    When I create a collection item located in "Storage room 3"

    Then I can see a collection item located in "Storage room 3"

  Scenario: Add a collection item with an acquisition-number
    When I create a collection item with acquisition number 001

    Then I can see a collection item with acquisition number 001

  Scenario: Attempt to create a collection item with a duplicate acquisition-number
    When I create a collection item with acquisition number 001
    Then I create a collection item with acquisition number 001

    Then I can see a "has already been taken" error for the collection item acquisition-number