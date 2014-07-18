Feature: Resource editing

  Background:
    Given I have signed in with valid credentials

  Scenario: Edit resource description
    When I create a new resource with title "Test", and a description of "Test"
    And I change the resource description to "Mario Testino"

    Then I can see a resource entitled "Test" with description "Mario Testino"

  Scenario: Edit resource title
    When I create a new resource with title "Test1", and a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"
    And I change the resource title to "Test2"

    Then I can see an image resource with title "Test2", and a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"

  Scenario: Edit resource title to a pre-existing title
    When I create a new resource with title "Test1", and a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"
    And I create a new resource with title "Test2", and a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"
    And I change the resource title to "Test1"

    Then I can see a "has already been taken" error for the resource title