Feature: user creates advertising types

As a User
I need to create Advertising Type classifiers.
As the Advertising Type will be important during reporting.

  Scenario: user can see an index of advertising types
    Given I am signed in
    When I have an AdvertisingType, "Street Card Flipper"
    Then I should see the advertising type "Street Card Flipper" on my AdvertisingType index

  @javascript
  Scenario: user can add a new advertising type to their index
    Given I am signed in
    When I add an AdvertisingType "Flash Mob"
    Then I should see the advertising type "Flash Mob" on my AdvertisingType index