Feature: user creates vendors

As a User
I need to create Vendors.  Vendors may be used in relation to many Engagements.
As Contracts will be purchased through specific Vendors

  Scenario: user can see an index of vendors
    Given I am signed in
    When I have a vendor, "ClearChannel"
    Then I should see the vendor "ClearChannel" on my vendor index

  @javascript
  Scenario: user can add a new vendor to their index
    Given I am signed in
    When I add a vendor "BigAss Ads"
    Then I should see the vendor "BigAss Ads" on my vendor index