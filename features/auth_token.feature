Feature: Authentication token integration
  The API will send a JSON response in order to get
  the user token and sudomain

  Scenario: Email and password are correct
    Given a User
    Given a JSON request with email and password are correct
  	Then respond a JSON with token and subdomain

  Scenario: Email correct, password incorrect
    Given a User
    Given a JSON request with email correct and password incorrect
  	Then respond a JSON response would have to be with 'Password incorrect' description:
  	"""
  	{
      "status" : "ERROR",
      "description" : "Password incorrect",
      "response" : {}
    }
  	"""

  Scenario: Email incorrect, password correct
    Given a User
    Given a JSON request with email incorrect and password correct
  	Then the JSON response would have to be with 'Email incorrect' description:
  	"""
  	{
      "status" : "ERROR",
      "description" : "Email incorrect",
      "response" : {}
    }
  	"""

  Scenario: Appears email, not password
    Given a User
    Given a JSON request with nil or empty params
  	Then the JSON response would have to be with 'Need password to process de request' description:
  	"""
  	{
      "status" : "ERROR",
      "description" : "Need password to process de request",
      "response" : {}
    }
  	"""

  Scenario: Email does not appear, password appear
    Given a User
    Given a JSON request with nil or empty params
  	Then the JSON response would have to be with 'Need email to process de request' description:
  	"""
  	{
      "status" : "ERROR",
      "description" : "Need email to process de request",
      "response" : {}
    }
  	"""