Feature: Edit pre-existing collection items

  Background:
    Given I have signed in as an admin

  Scenario: Change name
    Given I have created a collection item
    When I change the collection item name to "A tube"

    Then I can see a collection item called "A tube"

  Scenario: Can't change name to one which already exists
    Given I have created a collection item called "A tube"
    When I create a collection item
    And I change the collection item name to "A tube"

    Then I can see a "has already been taken" error for the collection item name

  Scenario: Edit description
    Given I have created a collection item
    When I change the collection item description to "This is a tube"

    Then I can see a collection item with description "This is a tube"

  Scenario: Change location
    Given I have created a collection item
    When I change the collection item location to "France"

    Then I can see a collection item located in "France"

  Scenario: Change acquisition number
    Given I have created a collection item
    When I change the collection item acquisition number to "007"

    Then I can see a collection item with acquisition number 007

  Scenario: Can't change acquisition number to one which already exists
    Given I have created a collection item with acquisition number 007
    When I create a collection item
    And I change the collection item acquisition number to "007"

    Then I can see a "has already been taken" error for the collection item acquisition number