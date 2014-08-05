Feature: Navigation
  User should be able to navigate about the site

Scenario: When I am not signed in I see the correct navigation menu
  Given I am not signed in

  Then I see the basic navigation menu

Scenario: Admins see the correct navigation menu
  Given I am signed in as an admin

  Then I see the user navigation menu

Scenario: Users see the correct navigation menu
  Given I have signed in with valid credentials

  Then I see the user navigation menu