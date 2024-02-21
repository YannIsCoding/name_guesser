require 'sinatra'
require_relative 'app/name_origin'

get '/' do
  name = params['name']
  guessed_countries = NameOrigin.new(name).guess
  { guessed_country: guessed_countries, requested_name: name, time_processed: [] }.to_json
end
