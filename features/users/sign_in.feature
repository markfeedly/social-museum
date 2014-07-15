Feature: Sign in
  In order to get access to protected sections of the site
  A user
  Should be able to sign in

  Scenario: Sign up successfully
    Given I do not exist as a user
    And I sign up
    And I confirm my email identity
    Then I should have signed up successfully

  Scenario: User signs in successfully
    Given I exist as a user
    And I am not signed in
    When I sign in with valid credentials
    Then I see a successful sign in message
    When I return to the site
    Then I should be signed in

  Scenario: User enters wrong email
    Given I exist as a user
    And I am not signed in
    When I sign in with a wrong email
    Then I see an invalid sign in message
    And I should be signed out

  Scenario: User enters wrong password
    Given I exist as a user
    And I am not signed in
    When I sign in with a wrong password
    Then I see an invalid sign in message
    And I should be signed out

  Scenario: User is not signed up
    Given I do not exist as a user
    When I try to sign in with invalid credentials
    Then I see an invalid sign in message
    And I should be signed out