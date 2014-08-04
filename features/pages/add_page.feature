Feature: Wiki page addition

  Background:
    Given I have signed in with valid credentials

  Scenario: I add one page
    When I create a page

    Then I can see a page

  Scenario Outline: I add pages
    When I create <Number> pages

    Then I can see <Number> pages

  Examples:
    |Number|
    |0     |
    |1     |
    |2     |
    |3     |
    |9     |
    |10    |
    |11    |
    |19    |
    |20    |
    |21    |

  Scenario: Add a page with a title
    When I create a page entitled "Test"

    Then I can see a page entitled "Test"

  Scenario: Add a page with  content
    When I create a page with content "My content"

    Then I can see a page with content "My content"

  Scenario: I can add a page with tags which are just letters
    When I create a page with tags "a, bb"

    Then I can see a page with tags "a, bb"

  Scenario: Special characters %, ., ? and ; won't submit as tags
    When I create a page with tags "a, bb, ccc, %, ., ?, ;"

    Then I can see a page with tags "a, bb"

  Scenario: I can't add hyperlinks to categories
    When I create a page with categories "a, http://www.google.com"

    Then I can see an "Links are not allowed as categories" error for the page categories

  Scenario: I can't add .jpgs to categories
    When I create a page with categories "a, image.jpg"

    Then I can see an "Links are not allowed as categories" error for the page categories

  Scenario: I can't add .jpegs to categories
    When I create a page with categories "a, image.jpeg"

    Then I can see an "Links are not allowed as categories" error for the page categories

  Scenario: I can't add .pngs to categories
    When I create a page with categories "a, google.png"

    Then I can see an "Links are not allowed as categories" error for the page categories

  Scenario: I can't add .gifs to categories
    When I create a page with categories "a, google.gif"

    Then I can see an "Links are not allowed as categories" error for the page categories

  Scenario: I can't add hyperlinks to categories
    When I create a page with categories "a, http://www.google.com"

    Then I can see an "Links are not allowed as categories" error for the page categories

  Scenario: I can't add .jpgs to categories
    When I create a page with categories "a, image.jpg"

    Then I can see an "Links are not allowed as categories" error for the page categories

  Scenario: I can't add .jpegs to categories
    When I create a page with categories "a, image.jpeg"

    Then I can see an "Links are not allowed as categories" error for the page categories

  Scenario: I can't add .pngs to categories
    When I create a page with categories "a, google.png"

    Then I can see an "Links are not allowed as categories" error for the page categories

  Scenario: I can't add .gifs to categories
    When I create a page with categories "a, google.gif"

    Then I can see an "Links are not allowed as categories" error for the page categories