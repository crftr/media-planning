Feature: user authentication

  @javascript
  Scenario: user signs in
    Given a user with username "river" and password "secret_123!"
    When I sign in manually as "river" with password "secret_123!"
    Then I should see the sign in success message
    And I should be on my dashboard

  Scenario: user signs out
    Given I am signed in
    When I sign out
    Then I should be on the homepage
    And I should see the sign out message
