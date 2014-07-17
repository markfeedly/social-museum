Feature: Resource page removal

  Background:
    Given I have signed in with valid credentials

  Scenario: Admins can remove resources
    Given I turn an existing user into an administrator
    And I create a new resource with title "Test", and a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"
    And I remove a resource with title "Test", and a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"