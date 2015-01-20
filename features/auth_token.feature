Feature: Auth token integration

  Scenario: Respond token and subdomain
  	Given a JSON request with email and password:
  	"""
  	{"email" : "isaac@cursa.me", "password": "pinocho"}

  	"""
  	Then respond a JSON with token and subdomain like:
  	"""
  	{"token": "a unique token p/user", "subdomain": "cursa.me"}
  	"""

