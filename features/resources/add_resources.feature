Feature: Resource addition

  Background:
    Given I have signed in with valid credentials

  Scenario: Add a resource and see it
    When I create a new resource with a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"

    Then I can see a resource with a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"

  Scenario: Add a pair to resources and see them
    When I create a new resource with a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"
    And I create a new resource with a link to "http://i16.photobucket.com/albums/b24/mustangii/cat-tax-cat-with-gun-looking-out-window-760030.jpg"

    Then I can see a resource with a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"
    And I can see a resource with a link to "http://i16.photobucket.com/albums/b24/mustangii/cat-tax-cat-with-gun-looking-out-window-760030.jpg"

  Scenario: Add a resource associated with a page
    When I create a page entitled "Test"
    And I create a new resource associated with a page entitled "Test"

    Then I can see a resource associated with a page entitled "Test"
    
  Scenario: Add a resource with a description
    When I create a new resource with a description of "My content"

    Then I can see a resource with description "My content"