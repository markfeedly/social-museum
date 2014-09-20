Feature: Collection items should record their history
  
  Background: 
    Given I have signed in as an admin

  Scenario: Changes to the name should be recorded in history
    When I create a collection item called "Vac tubes"
    And I change the collection item name to "Vacum tubes"
    And I change the collection item name to "Vacuum tubes"

    Then I can see collection item history contains "Vacuum tubes" as most recent
    And I can see collection item history contains "Vacum tubes" as second most recent
    And I can see collection item history contains "Vac tubes" as third most recent

  Scenario: Changes to description should be recorded in history
    When I create a collection item with description "First description"
    And I change the collection item description to "Second description"
    And I change the collection item description to "Third description"

    Then I can see collection item history contains "Third description" as most recent
    And I can see collection item history contains "Second description" as second most recent
    And I can see collection item history contains "First description" as third most recent

  Scenario: Changes to location should be recorded in history
    When I create a collection item located in "Kilburn"
    And I change the collection item location to "Kilburn floor 2"
    And I change the collection item location to "Kilburn 2.35"

    Then I can see collection item history contains "Kilburn 2.35" as most recent
    And I can see collection item history contains "Kilburn floor 2" as second most recent
    And I can see collection item history contains "Kilburn" as third most recent

  Scenario: Changes to acquisition number should be recorded in history
    When I create a collection item with acquisition number 000
    And I change the collection item acquisition number to "001"
    And I change the collection item acquisition number to "007"

    Then I can see collection item history contains "007" as most recent
    And I can see collection item history contains "001" as second most recent
    And I can see collection item history contains "000" as third most recent