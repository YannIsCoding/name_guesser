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

## Accompanying comment:

After a short reflection, I discarded the heuristic option. It would have to be too complex to be useful and probably would never be fully accurate.

The option I settle for is a list of names with country of origin saved in a yaml. The advantage are:
- High accuracy
- High speed, it's a simple look up, no computation
- No need for a DB. New names are rarely created or changed, data will only be read.
- The lack of DB on top of the reduced complexity will reduce run time by avoiding a back and forth between server and DB.

The only drawdown is that we need to scrape the original data.

The scope of the project is so small that I chose Sinatra to build it. This gave me the chance to experiment with something different.

Since TDD is a core component of my workflow, I have added test. I used minitest spec, as I was curious about it. This promise to offer both the speed of minitest with the structured approach of Rspec. Unfortunately, there is no documentation on how to test a Sinatra app with minitest Spec. So I ended up using it only for the unit test and reverting to regular minitest for the integration test.

The app is fairly secure because there is not much you can do to it. There is no database to corrupt and no user data to steal.

### Next step:
Now, to conquer the name guessing app market and achieve the unicorn status, we should not stop here. Here are a few suggestions to improve our service:
- Add more name to our yaml file
- Add support for transliteration. A candidate of choice for that is ActiveSupport::Inflector.
- Add validation and proper HTTP error. For now, we only return an empty result in all cases.
- Add a proper URL formatting standard, for now we always return a JSON and ignore any :format option.
- Add monitoring or log system to track list of the most demanded name we don’t support





