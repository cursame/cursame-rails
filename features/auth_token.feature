Feature: Authentication token integration
  The API will send a JSON response in order to get
  the user token and sudomain

  Scenario: Email and password are correct
    Given a JSON request with email and password are correct like:
  	"""
  	{"email" : "isaac@cursa.me", "password": "pinocho"}

  	"""
  	Then respond a JSON with token and subdomain like:
  	"""
  	{
      "status" : "OK",
      "description" : "The request has succeeded",
      "response" : {
        "token" : "token_aqui",
        "subdomain" : "version4"
      }
    }

  	"""

  Scenario: Email correct, password incorrect
    Given a JSON request with email correct and password incorrect like:
  	"""
  	{"email" : "isaac@cursa.me", "password": "pinochos"}

  	"""
  	Then respond a JSON response would have to be with 'Password incorrect' description:
  	"""
  	{
      "status" : "ERROR",
      "description" : "Password incorrect",
      "response" : {}
    }

  	"""

  Scenario: Email incorrect, password correct
    Given a JSON request with email incorrect and password correct like:
  	"""
  	{"email" : "isaacs@cursa.me", "password": "pinocho"}

  	"""
  	Then the JSON response would have to be with 'Email incorrect' description:
  	"""
  	{
      "status" : "ERROR",
      "description" : "Email incorrect",
      "response" : {}
    }

  	"""


  Scenario: Appears email, not password
    Given a JSON request with nil or empty params like:
  	"""
  	{"email" : "isaac@cursa.me"}

  	"""
  	Then the JSON response would have to be with 'Need password to process de request' description:
  	"""
  	{
      "status" : "ERROR",
      "description" : "Need password to process de request",
      "response" : {}
    }

  	"""

  Scenario: Email does not appear, password appear
    Given a JSON request with nil or empty params like:
  	"""
  	{"password": "pinocho"}

  	"""
  	Then the JSON response would have to be with 'Need email to process de request' description:
  	"""
  	{
      "status" : "ERROR",
      "description" : "Need email to process de request",
      "response" : {}
    }

  	"""

  Scenario: Request haven't CONTENT_TYPE equal to application/json
    Given a request with URL params.
    Then the JSON request shouldn't pass to process the data, and response should be like:
    """
    {
      "status" : "ERROR",
      "description" : "The request must be JSON",
      "response" : {}
    }

    """

