Feature: Wiki resource editing

  Background:
    Given I have signed in with valid credentials

  Scenario: Edit resource title to a pre-existing title
    When I create a new resource with title "Test1" and link of "http://media.npr.org/images/picture-show-flickr-promo.jpg"
    And I create a new resource with title "Test2" and link of "http://media.npr.org/images/picture-show-flickr-promo.jpg"
    And I change the resource title to "Test1"

    Then I can see a "has already been taken" error for the resource title