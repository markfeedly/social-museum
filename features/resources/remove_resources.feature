Feature: Resource page removal

  Background:
    Given I have signed in with valid credentials

  Scenario: Admins can remove resources
    When I become an admin
    And I create a new resource with title "Test", and a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"
    And I remove a resource with title "Test"

    Then I cannot see an image resource with title "Test", and a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"

  Scenario: Standard users cannot remove pages
    When I create a new resource with title "Test", and a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"

    Then I cannot remove a resource with title "Test"
    And I can see an image resource with title "Test", and a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"