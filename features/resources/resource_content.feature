Feature: Wiki page contents

  Background:
    Given I have signed in with valid credentials

  Scenario: Creation of an image
    When I create a new resource with title "Test", and a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"

    Then I can see a rendition of an image

  Scenario: Creation of YouTube resource
    When I create a new resource with title "Test", and a link to "http://www.youtube.com/watch?v=vGakGgd-pDs"

    Then I can see the YouTube video "vGakGgd-pDs"

  Scenario: Creation of Vimeo resource
    When I create a new resource with title "Test", and a link to "http://vimeo.com/originals/ownyourtomorrow/93491987"

    Then I can see the Vimeo video "93491987"