Feature: The teacher sign up form have new data fields 

Scenario: Migration in the database
	Given we have a "User" Model
	When we test the "User" Model
	Then the Test Model should have atrribute "gender"
	And the Test Model should have atrribute "birthday"

