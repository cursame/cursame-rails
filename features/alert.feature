Feature: URL Alert

  @javascript
  Scenario: Send an success alert
    Given I exist as an user
      And I have signed in with valid credentials 
     When I visit cursame with success alert parameters
     Then the success alert message must be displayed

  @javascript
  Scenario: Send an error alert
    Given I exist as an user
      And I have signed in with valid credentials 
     When I visit cursame with error alert parameters
     Then the error alert message must be displayed

  @javascript
  Scenario: Send an error alert
    Given I exist as an user
      And I have signed in with valid credentials 
     When I visit cursame with notice alert parameters
     Then the notice alert message must be displayed
