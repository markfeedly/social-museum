Feature: Wiki page addition

  Background:
    Given I have signed in with valid credentials

  Scenario: I can add a page with tags which are just letters, which are made lowercase
  When I create a page with tags "a, BB"

  Then I can see a page with tags "a, bb"

  Scenario: I can add a page with categories which are just letters
  When I create a page with categories "a, BB"

  Then I can see a page with categories "a, BB"

  Scenario: Special characters won't submit as tags
  When I create a page with tags "a, bb, ccc, !£$%^&*()+={}[]@~'#<>?,./|\"

  Then I can see a page with tags "a, bb, ccc"

  Scenario: Special characters won't submit as categories
  When I create a page with categories "a, bb, ccc, !£$%^&*()+={}[]@~'#<>?,./|\"

  Then I can see a page with categories "a, bb, ccc"

  Scenario: Whitespace is compacted in tags
  When I create a page with tags "a, b  b"

  Then I can see a page with tags "a, b b"

  Scenario: Whitespace is compacted in categories
  When I create a page with categories "a, b  b"

  Then I can see a page with categories "a, b b"

  Scenario: Tags are alphabetised
  When I create a page with tags "bb, a"

  Then I can see a page with tags "a, bb"

  Scenario: Categories are alphabetised
  When I create a page with categories "bb, a, BB, A"

  Then I can see a page with categories "A, a, BB, bb"