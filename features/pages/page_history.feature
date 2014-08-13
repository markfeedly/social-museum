Feature: Wiki pages should record their history

  Background:
    Given I have signed in with valid credentials

  Scenario: Changes to the title should be recorded in history
    When I create a page with content "My Page"
    And I change the page title to "Mario Testino's Page"
    And I change the page title to "Mario Testino's Favourite Page"

    Then I can see page history contains "Mario Testino's Favourite Page" as most recent
    And I can see page history contains "Mario Testino's Page" as second most recent
    And I can see page history contains "My Page" as third most recent

  Scenario: Changes to content should be recorded in history
    When I create a page with content "Test me"
    And I change the page content to "Mario Testino"
    And I change the page content to "Famous Photographer"

    Then I can see page history contains "Famous Photographer" as most recent
    And I can see page history contains "Mario Testino" as second most recent
    And I can see page history contains "Test me" as third most recent