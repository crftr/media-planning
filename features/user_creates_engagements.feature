Feature: user creates engagements

As a User
I need to create Engagements for Clients
As the Engagements encapsulate the purchases and sales

  Scenario: user can see an index of their engagements
    Given I am signed in
    When I have an engagment, "Tacos SoCal"
    Then I should see the engagement "Tacos SoCal" on my engagement index

  @javascript
  Scenario: user can add a new engagement to their index
    Given I am signed in
    When I add an engagement "Sandwich Seasonal 2014" under the client "Good Dog LLC"
    Then I should see the engagement "Sandwich Seasonal 2014" on my engagement index