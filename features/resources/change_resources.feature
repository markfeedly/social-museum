Feature: Resource editing

  Background:
    Given I have signed in with valid credentials

  Scenario: Edit resource description
    When I create a new resource with a description of "Test"
    And I change the resource description to "Mario Testino"

    Then I can see a resource with description "Mario Testino"

  Scenario: Edit resource title
    When I create a new resource with a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"
    And I change the resource title to "Test2"

    Then I can see a resource with a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"

  Scenario: Edit resource title to a pre-existing title
    When I create a new resource with a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"
    And I create a new resource with a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"

    Then I can see a "already exists" error for the resource url

  Scenario: Admins can edit resources
    When I create a new resource entitled "Test" with a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"
    And I am signed in as an admin
    And I go to a resource entitled "Test"
    And I change the resource url to "http://i16.photobucket.com/albums/b24/mustangii/cat-tax-cat-with-gun-looking-out-window-760030.jpg"

    Then I can see a resource with a link to "http://i16.photobucket.com/albums/b24/mustangii/cat-tax-cat-with-gun-looking-out-window-760030.jpg"

  Scenario: Users can edit their own resources
    When I create a new resource entitled "Test" with a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"
    And I change the resource url to "http://i16.photobucket.com/albums/b24/mustangii/cat-tax-cat-with-gun-looking-out-window-760030.jpg"

    Then I can see a resource with a link to "http://i16.photobucket.com/albums/b24/mustangii/cat-tax-cat-with-gun-looking-out-window-760030.jpg"