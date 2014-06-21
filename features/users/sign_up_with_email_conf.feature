Feature: Sign up with email confirmation
  In order to use the site
  As a user
  I want to be able to sign up

  Scenario: Sign up successfully
    Given there are the following users:
      | email             | password | password_confirmation |
      | user@ticketee.com | passwd12 | passwd12              |
    And "user@ticketee.com" opens the email with subject "Confirmation instructions"
    And they click the first link in the email
    Then I should see "Your account was successfully confirmed"
