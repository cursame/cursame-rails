Feature: The teacher sign up form have new data fields 

	Scenario: Migration in the database
		Given we have a "User" Model
		 When we test the "User" Model
		 Then the Test Model should have attribute "gender"
		 And the Test Model should have attribute "birthday"

	Scenario: New model in the database
		Given we have a "UserProperty" Model
		 When we test the "UserProperty" Model
		 Then the Test Model should have attribute "user_id"
		 And the Test Model should have attribute "property"
		 And the Test Model should have attribute "value"


