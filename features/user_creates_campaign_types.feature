Feature: user creates campaign types

As a User
I need to create Campaign Type classifiers.
As the Campaign Type will be important during reporting.

  Scenario: user can see an index of campaign types
    Given I am signed in
    When I have a CampaignType, "Social Media"
    Then I should see the campaign type "Social Media" on my CampaignType index

  @javascript
  Scenario: user can add a new campaign type to their index
    Given I am signed in
    When I add a CampaignType "Telepathy"
    Then I should see the campaign type "Telepathy" on my CampaignType index