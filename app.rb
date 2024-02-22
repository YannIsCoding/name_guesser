require 'sinatra'
require_relative 'app/name_origin'

get '/' do
  start_time = Time.now
  name = params['name']

  if name.nil?
    return { guessed_country: [], requested_name: nil, time_processed: [(Time.now - start_time)] }.to_json
  end

  guessed_country = NameOrigin.new(name).guess
  { guessed_country:, requested_name: name, time_processed: [(Time.now - start_time)] }.to_json
end
