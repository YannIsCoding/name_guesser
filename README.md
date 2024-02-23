## Task
Write a small web-service which offers the following functionality: for a given last name
(surname), the service should respond with the country it's most likely to come from.

The request will be using GET, proving the parameter “name”, e.g.
- curl “http://country_guess?name=Müller”
  
The response format should be JSON and including three keys:
- guessed_country: [DE, US, NL, ...]
- requested_name: [echo name parameter]
- time_processed: [time passed by while guessing the country]

Any (plausible) way of guessing the country is okay (e.g. heuristic, database, external
web-service, whatever :))

Of course our service should be secure (and fast if possible)
