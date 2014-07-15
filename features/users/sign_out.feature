Feature: Sign out
  To protect an account from unauthorized access
  A signed in user
  Should be able to sign out

  Scenario: User signs out
    Given I exist as a user
    And I am not signed in
    And I sign in with valid credentials
    When I sign out
    Then I should see a signed out message
    When I return to the site
    Then I should be signed out
