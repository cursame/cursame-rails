Feature: Radar network integration
  
  Scenario: Get a radar network token
    Given a network
    Then check if it has a radar token
    Then get radar token
