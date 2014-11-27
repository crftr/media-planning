Feature: user creates contracts

As a User
I need to create Contracts.
As Contracts exist as the container for Vendor Advertising products.

  Scenario: user can see an index of contracts
    Given I am signed in
    When I have a contract, "ClearChannel 2014"
    Then I should see the contract "ClearChannel 2014" on my contract index
