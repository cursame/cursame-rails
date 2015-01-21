Feature: Gospel integration

  Scenario: Creating a new user
    Given a new user
     Then a task should be queued on Gospel::UsersWorker queue

  Scenario: Creating a new network
    Given a new network
     Then a task should be queued on Gospel::NetworksWorker queue

  Scenario: User login
    Given I exist as a user
     When I sign in with valid credentials
     Then I successfully sign in
     Then a task should be queued on Gospel::LoginsWorker queue
