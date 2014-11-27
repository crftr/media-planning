Feature: user dashboard links to core data

As a User
I need quick access to list and create new data
To effectively manage my configuration

  Scenario: user dashboard has links to list clients, engagements, and vendors
    Given I am signed in
    When I am viewing my dashboard
    Then I should see a link to my client list
    And I should see a link to my engagement list
    And I should see a link to my vendor list

  Scenario: user dashboard has links to add a new client, engagement, and vendor
    Given I am signed in
    When I am viewing my dashboard
    Then I should see a link to add a new client
    And I should see a link to add a new engagement
    And I should see a link to add a new vendor