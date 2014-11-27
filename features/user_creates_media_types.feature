Feature: user creates media types

As a User
I need to create Media Type classifiers.
As the Media Type will be important during reporting.

  Scenario: user can see an index of media types
    Given I am signed in
    When I have a MediaType, "ESP Projection"
    Then I should see the media type "ESP Projection" on my MediaType index

  @javascript
  Scenario: user can add a new media type to their index
    Given I am signed in
    When I add a MediaType "Hologram"
    Then I should see the media type "Hologram" on my MediaType index
