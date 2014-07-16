Feature: Resource addition

  Background:
    Given I have signed in with valid credentials

  Scenario: Add an image resource and see it
    When I create a new resource with title "Test" and link of "http://media.npr.org/images/picture-show-flickr-promo.jpg"

    Then I can see an image resource with title "Test" and link of "http://media.npr.org/images/picture-show-flickr-promo.jpg"

  Scenario: Add a pair of resources and see them
    When I create a new resource with title "Test1" and link of "http://media.npr.org/images/picture-show-flickr-promo.jpg"
    And I create a new resource with title "Test2" and link of "http://i16.photobucket.com/albums/b24/mustangii/cat-tax-cat-with-gun-looking-out-window-760030.jpg"

    Then I can see an image resource with title "Test1" and link of "http://media.npr.org/images/picture-show-flickr-promo.jpg"
    And I can see an image resource with title "Test2" and link of "http://i16.photobucket.com/albums/b24/mustangii/cat-tax-cat-with-gun-looking-out-window-760030.jpg"

  Scenario: Add a resource associated with a page
    When I create a page entitled "Test" with content "My content"
    And I create a new resource with title "Test" and a link of "http://media.npr.org/images/picture-show-flickr-promo.jpg", associated with page "Test"

    Then I can see a resource with title "Test" and a link of "http://media.npr.org/images/picture-show-flickr-promo.jpg", associated with page "Test"