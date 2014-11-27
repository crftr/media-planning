Feature: user creates clients

As a User of MediaPlanning
I need the ability to add Clients to my account
Because all actions are done on-behalf of a Client

  Scenario: user can see an index of their clients
    Given I am signed in
    When I have a client, "Cheese"
    Then I should see the client "Cheese" on my client index

  @javascript
  Scenario: user can add a new client to their index
    Given I am signed in
    When I add a client, "Big Green Surfboards"
    Then I should see the client "Big Green Surfboards" on my client index