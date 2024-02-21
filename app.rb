require 'sinatra'
require_relative 'app/name_origin'

get '/' do
  start_time = Time.now
  name = params['name']
  guessed_country = NameOrigin.new(name).guess
  { guessed_country:, requested_name: name, time_processed: [(Time.now - start_time)] }.to_json
end
