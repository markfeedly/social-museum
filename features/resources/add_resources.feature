Feature: Resource addition

  Background:
    Given I have signed in with valid credentials

  Scenario: Adding a link to an image on the web
    When I create a new resource with a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"

    Then I can see a resource with a link to "http://media.npr.org/images/picture-show-flickr-promo.jpg"

  Scenario: Add a pair of links to images on the web
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

  Scenario: Uploading an image as a resource
    When I create a new resource with an upload Turkish_Van_Cat.jpg

    Then I can see a resource with a link to Turkish_Van_Cat.jpg in images

  Scenario: Uploading a tarball as a resource
    When I create a new resource with an upload Turkish_Van_Cat.tar

    Then I can see a resource with a link to Turkish_Van_Cat.tar in archives

  Scenario: Uploading a word document as a resource
    When I create a new resource with an upload Turkish_Van_Cat.docx

    Then I can see a resource with a link to Turkish_Van_Cat.docx in documents